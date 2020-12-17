import 'dart:async';
import 'dart:convert';

import 'package:crypton/crypton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validator/app/utils/utils.dart';
import 'package:validator/controllers/controllers.dart';
import 'package:validator/models/saved_vaults_model.dart';
import 'package:validator/models/transfer_detail_model.dart';
import 'package:validator/repositories/transfers_repository.dart';
import 'package:validator/repositories/vaults_repository.dart';
import 'package:validator/services/crypto/crypto_service.dart';
import 'package:validator/services/device_info_service.dart';
import 'package:validator/src/api.pb.dart';
import 'package:validator/ui/pages/home/pages/requests/detail/transfer_detail_page.dart';

class RequestsController extends GetxController with WidgetsBindingObserver {
  static RequestsController get con => Get.find();

  static const PERIODIC_FETCH_DELTA_SEC = 30;

  final _repository = TransfersRepository();
  final _crypto = Get.find<CryptoService>();

  Timer _requestsReloadTimer;

  RSAPrivateKey _privateKey;

  var requests = <TransferDetailArgs>[];

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    if (_loading != value) {
      _loading = value;
      update();
    }
  }

  bool get showEmptyCondition =>
      (requests == null || requests.isEmpty) && !loading;

  @override
  void onInit() async {
    _privateKey = await _crypto.rsaPrivateKey;
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  @override
  void onReady() {
    _startPeriodicFetch();
    super.onReady();
  }

  @override
  void onClose() {
    _stopPeriodicFetch();
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        reloadRequests().whenComplete(() => _startPeriodicFetch());
        break;
      case AppLifecycleState.paused:
        _stopPeriodicFetch();
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      default:
        break;
    }
  }

  Future<void> reloadRequests() async {
    loading = true;
    await silentReloadRequests();
    loading = false;
  }

  void openDetails(TransferDetailArgs args) =>
      Get.toNamed(TransferDetailPage.route, arguments: args);

  Future<void> silentReloadRequests({bool showErrors = true}) =>
      _updateRequests(showErrors: showErrors).whenComplete(() => update());

  Future<void> _updateRequests({bool showErrors = true}) async {
    String deviceInfoUID = await DeviceInfoService.deviceInfo;

    requests.clear();
    for (Vault vault in VaultsRepository.savedVaultsList) {
      var approvalRequests = await _repository.getApprovalRequests(
        deviceInfo: deviceInfoUID,
        apiKey: vault.apiKey,
        showErrorDialog: showErrors,
      );
      var transferDetails = approvalRequests
          .map((r) => _buildTransferDetail(r, vault, showErrors))
          .where((e) => e != null)
          .toList();

      transferDetails.forEach((details) {
        int index = requests.indexWhere(
          (e) => e.transferSigningRequestId == details.transferSigningRequestId,
        );
        if (index < 0) requests.add(details);
      });
      requests.addAll(transferDetails);
    }
  }

  TransferDetailArgs _buildTransferDetail(
    GetApprovalRequestsResponse_ApprovalRequest request,
    Vault vault,
    bool showLogs,
  ) {
    try {
      var secretEncBase64 = base64.decode(request.secretEncBase64);
      var secretDecr = _privateKey.decryptData(secretEncBase64);
      var secretKey = base64.encode(secretDecr);

      var decryptedJson = _crypto.aesDecrypt(
        request.transactionDetailsEncBase64,
        request.ivNonce,
        secretKey,
      );
      var jsonMap = json.decode(decryptedJson);
      var transferDetail = TransferDetailModel.fromJson(jsonMap);

      if (showLogs) {
        AppLog.loggerNoStack.i('''
          ---- Transfer Detail Decrypt ----
          privateKeyPem: ${_privateKey.toPEM()}
          secretEncBase64: $secretEncBase64
          secretKey: $secretKey
          decryptedJson: $decryptedJson
          ''');
      }
      return TransferDetailArgs(
        transferDetail: transferDetail,
        transferSigningRequestId: request.transferSigningRequestId,
        aesSecretKey: secretKey,
        aesIvNonce: request.ivNonce,
        vault: vault,
      );
    } catch (e) {
      AppLog.logger.e(e);
      return null;
    }
  }

  void _startPeriodicFetch() {
    _requestsReloadTimer = Timer.periodic(
      const Duration(seconds: PERIODIC_FETCH_DELTA_SEC),
      (Timer t) => silentReloadRequests(showErrors: false),
    );
  }

  void _stopPeriodicFetch() => _requestsReloadTimer?.cancel();
}
