import 'package:KeyKeeperApp/app/utils/utils.dart';
import 'package:KeyKeeperApp/controller/controllers.dart';
import 'package:KeyKeeperApp/models/saved_vaults_model.dart';
import 'package:KeyKeeperApp/repositories/vaults_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VaultDetailController extends GetxController {
  static VaultDetailController get con => Get.find();

  final localNameController = TextEditingController();

  var vault = Vault();

  @override
  void onInit() {
    vault = Get.arguments as Vault;
    localNameController.text = vault.localName;
    super.onInit();
  }

  bool get edited => localNameController.text.trim() != vault.localName;

  bool get stausOk => true;

  void detachVault() => Get.defaultDialog(
        title: 'Delete vault?',
        content: SizedBox.shrink(),
        buttonColor: AppColors.dark,
        confirmTextColor: AppColors.primary,
        cancelTextColor: AppColors.dark,
        onConfirm: () => VaultsRepository.deleteVaultByKey(vault.apiKey)
            .whenComplete(() => VaultsController.con
                .reloadVaults()
                .whenComplete(() => Get.back(closeOverlays: true))),
        onCancel: () => Get.back(),
      );

  void save() => VaultsRepository.updateVault(
        vault..localName = localNameController.text.trim(),
      ).whenComplete(() {
        Get.rawSnackbar(
          message: 'Changes saved',
          snackStyle: SnackStyle.GROUNDED,
        );
        update();
      });

  Future<bool> back() async {
    if (edited) {
      await Get.defaultDialog(
        title: 'Save changes?',
        content: SizedBox.shrink(),
        buttonColor: AppColors.dark,
        confirmTextColor: AppColors.primary,
        cancelTextColor: AppColors.dark,
        onConfirm: () {
          save();
          VaultsController.con.reloadVaults();
          Get.back();
        },
        onCancel: () => true,
      );
    }
    return true;
  }
}
