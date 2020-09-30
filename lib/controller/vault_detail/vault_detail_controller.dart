import 'package:KeyKeeperApp/models/saved_vaults_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VaultDetailController extends GetxController {
  static VaultDetailController get con => Get.find();

  final localNameController = TextEditingController();

  var vault = Vault();

  @override
  void onInit() {
    vault = Get.arguments as Vault;
    super.onInit();
  }

  @override
  void onReady() {
    localNameController.text = vault.localName;
    super.onReady();
  }

  bool get stausOk => true;
}
