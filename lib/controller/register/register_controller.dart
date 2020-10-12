import 'dart:convert';

import 'package:validator/app/common/app_storage_keys.dart';
import 'package:validator/app/utils/app_config.dart';
import 'package:validator/app/utils/utils.dart';
import 'package:validator/services/crypto/crypto_service.dart';
import 'package:validator/services/qr_service.dart';
import 'package:validator/services/utils/dialog_manager.dart';
import 'package:validator/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController {
  static RegisterController get con => Get.find();

  final _config = Get.find<AppConfig>();
  final dataController = TextEditingController();
  final passwordController = TextEditingController();

  final _storage = GetStorage();
  final _crypto = Get.find<CryptoService>();

  bool get actionAllowed => isValidData && isValidPass;

  bool get isValidData => !dataController.text.isNullOrBlank;

  bool get isValidPass =>
      !passwordController.text.isNullOrBlank &&
      passwordController.text.length >= 8;

  AppConfig get appConfig => _config;

  Future<void> scanQRCode() async {
    dataController.text = await QrService.scan();
    update();
  }

  Future<void> submit() async {
    String decrypted = _decryptData();
    if (!decrypted.isNullOrBlank) {
      await _storage.write(AppStorageKeys.privateKey, decrypted);
      skip();
    }
  }

  void skip() => Get.offAllNamed(HomePage.route);

  String _decryptData() {
    try {
      // prepare data to encrypt backup with AES algorythm
      String passwordKey = passwordController.text;
      var passwordKeyBytes = utf8.encode(passwordKey);
      String keyValue = _crypto.sha256Hash(passwordKeyBytes);

      var rawDataBytes = base64.decode(dataController.text);
      assert(rawDataBytes.length >= 16);

      var nonceBytes = rawDataBytes.sublist(0, 16);
      var dataBytes = rawDataBytes.sublist(16);

      String nonce = base64.encode(nonceBytes);
      String input = base64.encode(dataBytes);

      // decrypt data
      String decrypted = _crypto.aesDecrypt(input, nonce, keyValue);
      return decrypted;
    } catch (e) {
      DialogManager().error(
        ErrorContent(title: 'Error decrypting data', message: e.toString()),
      );
      return null;
    }
  }
}
