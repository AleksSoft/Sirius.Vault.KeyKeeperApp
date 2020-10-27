import 'dart:convert';

import 'package:validator/services/crypto/crypto_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:validator/ui/pages/home/pages/backup/share_backup_page.dart';
import 'package:validator/utils/gesture_utils.dart';

class BackupController extends GetxController {
  static BackupController get con => Get.find();

  final passwordController = TextEditingController();

  final _crypto = Get.find<CryptoService>();

  RSAKeypairSir _keyPair;

  var encryptedBackup = '';

  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;

  bool get isValidPass =>
      !passwordController.text.isNullOrBlank &&
      passwordController.text.length >= 8;

  @override
  void onInit() async {
    _keyPair = await _crypto.rsaKeyPair;
    super.onInit();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    update();
  }

  void openBackupShare() {
    GestureUtils.unfocus();
    encryptedBackup = _getBackupData();
    Get.to(ShareBackupPage(), fullscreenDialog: true);
  }

  void share() => Share.share(encryptedBackup);

  String _getBackupData() {
    // prepare data to encrypt backup with AES algorythm
    String passwordKey = passwordController.text;
    var passwordKeyBytes = utf8.encode(passwordKey);
    String keyValue = _crypto.sha256Hash(passwordKeyBytes);

    // create nonce for AES encryption
    String nonce = _crypto.randNonce;
    var nonceBytes = base64.decode(nonce);

    // create backup model
    var input = _keyPair.privateKey.toPEM();

    // encrypt and obtain encryptedBytes
    String encrypted = _crypto.aesEncrypt(input, nonce, keyValue);
    var encryptedBytes = base64.decode(encrypted);

    // result = (nonceBytes+encryptedBytes)
    var appendedBytes = List<int>.from(nonceBytes)..addAll(encryptedBytes);
    String result = base64.encode(appendedBytes);
    return result;
  }
}
