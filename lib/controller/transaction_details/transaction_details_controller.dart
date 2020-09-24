import 'package:KeyKeeperApp/app/ui/app_colors.dart';
import 'package:KeyKeeperApp/src/api.pb.dart';
import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionDetailsController extends GetxController {
  static TransactionDetailsController get con => Get.find();

  final Map<int, ResolveApprovalRequestsRequest_ResolutionStatus>
      resolutionsMap = {
    0: ResolveApprovalRequestsRequest_ResolutionStatus.approve,
    1: ResolveApprovalRequestsRequest_ResolutionStatus.reject,
    2: ResolveApprovalRequestsRequest_ResolutionStatus.skip,
  };

  var msgTextController = TextEditingController();

  int get selectedResolutionIndex => resolutionsMap.keys.firstWhere(
        (key) => resolutionsMap[key] == selectedResolution,
        orElse: () => 0,
      );

  var selectedResolution =
      ResolveApprovalRequestsRequest_ResolutionStatus.approve;

  void copy(String value) =>
      ClipboardManager.copyToClipBoard(value).then((result) {
        Get.rawSnackbar(
          message: 'Selection copied to clipboard',
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
        onConfirm: () => Get.back(),
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
}
