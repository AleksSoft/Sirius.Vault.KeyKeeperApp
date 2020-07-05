import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalAuthController extends GetxController {
  final TextEditingController pinPutController = TextEditingController();
  final FocusNode pinPutFocusNode = FocusNode();

  @override
  void onReady() {
    super.onReady();
    pinPutFocusNode.requestFocus();
  }

  unfocus() {
    pinPutFocusNode.unfocus();
  }

  submit(String pin) {
    Get.snackbar('pin', pin);
  }
}
