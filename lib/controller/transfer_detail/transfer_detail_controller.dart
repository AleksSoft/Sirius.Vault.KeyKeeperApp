import 'package:KeyKeeperApp/app/ui/app_colors.dart';
import 'package:KeyKeeperApp/models/transfer_detail_model.dart';
import 'package:KeyKeeperApp/repositories/transfers_repository.dart';
import 'package:KeyKeeperApp/services/device_info_service.dart';
import 'package:KeyKeeperApp/src/api.pb.dart';
import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransferDetailController extends GetxController {
  static TransferDetailController get con => Get.find();

  final Map<int, ResolveApprovalRequestsRequest_ResolutionStatus>
      resolutionsMap = {
    0: ResolveApprovalRequestsRequest_ResolutionStatus.approve,
    1: ResolveApprovalRequestsRequest_ResolutionStatus.reject,
    2: ResolveApprovalRequestsRequest_ResolutionStatus.skip,
  };

  final _repository = Get.find<TransfersRepository>();

  var msgTextController = TextEditingController();

  TransferDetailModel transferDetail;

  int get selectedResolutionIndex => resolutionsMap.keys.firstWhere(
        (key) => resolutionsMap[key] == selectedResolution,
        orElse: () => 0,
      );

  var selectedResolution =
      ResolveApprovalRequestsRequest_ResolutionStatus.approve;

  @override
  void onInit() {
    transferDetail = Get.arguments as TransferDetailModel;
    super.onInit();
  }

  void copy(String title, String value) =>
      ClipboardManager.copyToClipBoard(value).then((result) {
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

  Future<void> checkSubmit() async => await Get.defaultDialog(
        title: '${getResolutionName(selectedResolutionIndex)}',
        middleText: 'Are you sure?',
        textConfirm: 'Confirm',
        textCancel: 'Cancel',
        confirmTextColor: AppColors.light,
        buttonColor: AppColors.dark,
        cancelTextColor: AppColors.dark,
        onConfirm: () => _resolveRequest().then((value) => Get.back()),
      );

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
    var deviceInfo = await DeviceInfoService.uid;

    return await _repository.resolveApprovalRequest(
      deviceInfo: deviceInfo,
      transferSigningRequestId: transferDetail.operationId,
      resolutionDocumentEnc: null,
      signature: null,
    );
  }
}
