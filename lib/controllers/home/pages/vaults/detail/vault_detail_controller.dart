import 'package:validator/app/common/common.dart';
import 'package:validator/app/utils/utils.dart';
import 'package:validator/controllers/controllers.dart';
import 'package:validator/models/saved_vaults_model.dart';
import 'package:validator/repositories/invites_repository.dart';
import 'package:validator/repositories/vaults_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VaultDetailController extends GetxController {
  static VaultDetailController get con => Get.find();

  final _repo = InvitesRepository();

  final localNameController = TextEditingController();

  var vault = Vault();

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    if (loading != value) {
      _loading = value;
      update();
    }
  }

  @override
  void onInit() {
    vault = Get.arguments as Vault;
    localNameController.text = vault.localName;
    super.onInit();
  }

  bool get edited => localNameController.text.trim() != vault.localName;

  bool get stausOk => true;

  void detachVault() {
    GestureUtils.unfocus();
    Get.defaultDialog(
      title: 'Are you sure to delete vault?',
      content: SizedBox.shrink(),
      buttonColor: AppColors.dark,
      confirmTextColor: AppColors.primary,
      cancelTextColor: AppColors.dark,
      onConfirm: () {
        loading = true;
        _repo.removeVaultConnection(apiKey: vault.apiKey).whenComplete(() {
          loading = false;
          VaultsRepository.deleteVaultByKey(vault.apiKey).whenComplete(
            () => VaultsController.con
                .reloadVaults()
                .whenComplete(() => Get.back(closeOverlays: true)),
          );
        });
      },
      onCancel: () {},
    );
  }

  void save() {
    GestureUtils.unfocus();
    VaultsRepository.updateVault(
      vault..localName = localNameController.text.trim(),
    ).whenComplete(() {
      Get.rawSnackbar(
        message: 'Changes saved',
        snackStyle: SnackStyle.GROUNDED,
      );
      update();
    });
  }

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
