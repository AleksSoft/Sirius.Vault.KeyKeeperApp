import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InviteController extends GetxController {
  static InviteController get con => Get.find();

  final inviteCodeController = TextEditingController();
  final vaultNameController = TextEditingController();

  bool get submitAllowed =>
      !inviteCodeController.text.isNullOrBlank &&
      !vaultNameController.text.isNullOrBlank;

  Future<void> submitCode() async {}

  Future<void> scanQRCode() async {
    inviteCodeController.text = await getQrCodeValue();
    update();
  }

  Future<String> getQrCodeValue() async {
    var result = await BarcodeScanner.scan();
    if (result.type == ResultType.Barcode) {
      return result.rawContent;
    } else {
      return '';
    }
  }
}
