import 'dart:async';
import 'dart:convert';

import 'package:validator/controller/controllers.dart';
import 'package:validator/models/saved_vaults_model.dart';
import 'package:validator/models/transfer_detail_model.dart';
import 'package:validator/repositories/transfers_repository.dart';
import 'package:validator/repositories/vaults_repository.dart';
import 'package:validator/services/crypto/crypto_service.dart';
import 'package:validator/services/device_info_service.dart';
import 'package:validator/src/api.pb.dart';
import 'package:validator/ui/pages/home/pages/requests/detail/transfer_detail_page.dart';
import 'package:crypton/crypton.dart';
import 'package:get/get.dart';

class RequestsController extends GetxController {
  static RequestsController get con => Get.find();

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

  bool get showEmptyContidion =>
      (requests == null || requests.isEmpty) && !loading;

  @override
  void onInit() async {
    _privateKey = await _crypto.rsaPrivateKey;
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
    super.onClose();
  }

  Future<void> reloadRequests() async {
    loading = true;
    await silentReloadRequests();
    loading = false;
  }

  void openDetails(TransferDetailArgs args) =>
      Get.toNamed(TransferDetailPage.route, arguments: args);

  Future<void> silentReloadRequests() =>
      _updateRequests().whenComplete(() => update());

  Future<void> _updateRequests() async {
    String deviceInfoUID = await DeviceInfoService.deviceInfo;

    requests.clear();
    for (Vault vault in VaultsRepository.savedVaultsList) {
      var approvalRequests = await _repository.getApprovalRequests(
        deviceInfo: deviceInfoUID,
        apiKey: vault.apiKey,
      );
      var transferDetails = approvalRequests
          .map((r) => _buildTransferDetail(r, vault))
          .where((element) => element != null)
          .toList();
      requests.addAll(transferDetails);
    }
  }

  TransferDetailArgs _buildTransferDetail(
    GetApprovalRequestsResponse_ApprovalRequest request,
    Vault vault,
  ) {
    try {
      var secretEncBase64 = base64.decode(request.secretEncBase64);
      var secretDecr = _privateKey.decryptData(secretEncBase64);
      String secretKey = base64.encode(secretDecr);

      String decryptedJson = _crypto.aesDecrypt(
        request.transactionDetailsEncBase64,
        request.ivNonce,
        secretKey,
      );

      var jsonMap = json.decode(decryptedJson);
      return TransferDetailArgs(
        transferDetail: TransferDetailModel.fromJson(jsonMap),
        transferSigningRequestId: request.transferSigningRequestId,
        aesSecretKey: secretKey,
        aesIvNonce: request.ivNonce,
        vault: vault,
      );
    } catch (e) {
      print(e);
      return null;
    }
  }

  void _startPeriodicFetch() {
    _requestsReloadTimer = Timer.periodic(
      const Duration(seconds: 30),
      (Timer t) => silentReloadRequests(),
    );
  }

  void _stopPeriodicFetch() => _requestsReloadTimer?.cancel();
}
