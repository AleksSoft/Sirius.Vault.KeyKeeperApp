import 'dart:convert';

import 'package:clipboard/clipboard.dart';
import 'package:validator/app/utils/utils.dart';
import 'package:validator/controller/controllers.dart';
import 'package:validator/models/resolution_document_model.dart';
import 'package:validator/models/saved_vaults_model.dart';
import 'package:validator/models/transfer_detail_model.dart';
import 'package:validator/repositories/transfers_repository.dart';
import 'package:validator/services/crypto/crypto_service.dart';
import 'package:validator/services/device_info_service.dart';
import 'package:validator/src/api.pb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

class TransferDetailController extends GetxController {
  static TransferDetailController get con => Get.find();

  final Map<int, ResolveApprovalRequestsRequest_ResolutionStatus>
      resolutionsMap = {
    0: ResolveApprovalRequestsRequest_ResolutionStatus.approve,
    1: ResolveApprovalRequestsRequest_ResolutionStatus.reject,
    2: ResolveApprovalRequestsRequest_ResolutionStatus.skip,
  };

  final _crypto = Get.find<CryptoService>();
  final _repository = TransfersRepository();

  var msgTextController = TextEditingController();

  TransferDetailArgs _transferDetailArgs;
  TransferDetailModel get transferDetail => _transferDetailArgs.transferDetail;

  var selectedResolution =
      ResolveApprovalRequestsRequest_ResolutionStatus.approve;

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    if (_loading != value) {
      _loading = value;
      update();
    }
  }

  int get selectedResolutionIndex => resolutionsMap.keys.firstWhere(
        (key) => resolutionsMap[key] == selectedResolution,
        orElse: () => 0,
      );

  @override
  void onInit() {
    _transferDetailArgs = Get.arguments as TransferDetailArgs;
    super.onInit();
  }

  void share() => Share.share(json.encode(transferDetail.toJson()));

  void copy(String title, String value) =>
      FlutterClipboard.copy(value).then((_) {
        if (Get.isSnackbarOpen) Get.back();
        Get.rawSnackbar(
          message: '$title copied to clipboard',
          snackStyle: SnackStyle.GROUNDED,
        );
      });

  void selectResolution(int index) {
    if (this.selectedResolution != resolutionsMap[index]) {
      this.selectedResolution = resolutionsMap[index];
      this.update();
    }
  }

  Future<void> checkSubmit() async {
    loading = true;
    await Get.defaultDialog(
      title: '${getResolutionName(selectedResolutionIndex)}',
      middleText: 'Are you sure?',
      textConfirm: 'Confirm',
      textCancel: 'Cancel',
      confirmTextColor: AppColors.light,
      buttonColor: AppColors.dark,
      cancelTextColor: AppColors.dark,
      onConfirm: () {
        _resolveRequest().then(
          (value) {
            RequestsController.con.reloadRequests();
            Get.back(closeOverlays: value);
          },
        );
      },
    );
    loading = false;
  }

  String getResolutionName(int index) {
    switch (resolutionsMap[index]) {
      case ResolveApprovalRequestsRequest_ResolutionStatus.approve:
        return 'Approve';
      case ResolveApprovalRequestsRequest_ResolutionStatus.reject:
        return 'Reject';
      case ResolveApprovalRequestsRequest_ResolutionStatus.skip:
        return 'Skip';
      default:
        return '';
    }
  }

  Future<bool> _resolveRequest() async {
    var deviceInfo = await DeviceInfoService.deviceInfo;

    var resolutionDocument = ResolutionDocumentModel(
      transferDetails: transferDetail,
      resolution: _getDocumentResolution(selectedResolution),
      resolutionMessage: msgTextController.text ?? '',
    );

    var resolutionDocumentEnc = _crypto.aesEncrypt(
      resolutionDocument.toString(),
      _transferDetailArgs.aesIvNonce,
      _transferDetailArgs.aesSecretKey,
    );

    var privateKey = await _crypto.rsaPrivateKey;
    var binaryDocument = utf8.encode(resolutionDocument.toString());
    var binarySignature = privateKey.createSHA256Signature(binaryDocument);
    var signatureBase64 = base64.encode(binarySignature);

    return await _repository.resolveApprovalRequest(
      deviceInfo: deviceInfo,
      transferSigningRequestId: _transferDetailArgs.transferSigningRequestId,
      resolutionDocumentEnc: resolutionDocumentEnc,
      signature: signatureBase64,
      apiKey: _transferDetailArgs.vault.apiKey,
    );
  }

  String _getDocumentResolution(
    ResolveApprovalRequestsRequest_ResolutionStatus status,
  ) {
    switch (status) {
      case ResolveApprovalRequestsRequest_ResolutionStatus.approve:
        return 'Approved';
      case ResolveApprovalRequestsRequest_ResolutionStatus.reject:
        return 'Rejected';
      case ResolveApprovalRequestsRequest_ResolutionStatus.skip:
        return 'Skipped';
      default:
        return '';
    }
  }
}

class TransferDetailArgs {
  final TransferDetailModel transferDetail;
  final String aesSecretKey;
  final String aesIvNonce;
  final String transferSigningRequestId;
  final Vault vault;
  TransferDetailArgs({
    @required this.transferDetail,
    @required this.transferSigningRequestId,
    @required this.aesSecretKey,
    @required this.aesIvNonce,
    @required this.vault,
  });
}
