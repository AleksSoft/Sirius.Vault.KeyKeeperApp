import 'dart:convert';

import 'package:KeyKeeperApp/models/backup_model.dart';
import 'package:KeyKeeperApp/services/crypto/crypto_service.dart';
import 'package:KeyKeeperApp/ui/pages/home/pages/backup/backup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

class BackupController extends GetxController {
  static BackupController get con => Get.find();

  final passwordController = TextEditingController();

  final _crypto = Get.find<CryptoService>();

  RSAKeypairSir _keyPair;

  var encryptedBackup = '';

  bool get isValidPass =>
      !passwordController.text.isNullOrBlank &&
      passwordController.text.length >= 8;

  @override
  void onInit() async {
    _keyPair = await _crypto.rsaKeyPair;
    super.onInit();
  }

  void openBackupShare() {
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
    var model = _keyPair.privateKey.toPEM();
    var modelBytes = utf8.encode(model.toString());

    // input = (nonceBytes+jsonBytes)
    var appendedBytes = List<int>.from(nonceBytes)..addAll(modelBytes);
    String input = base64.encode(appendedBytes);

    // encrypt
    String encrypted = _crypto.aesEncrypt(input, nonce, keyValue);
    return encrypted;
  }
}
