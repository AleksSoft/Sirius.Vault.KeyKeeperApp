import 'dart:convert';

import 'package:validator/app/common/app_storage_keys.dart';
import 'package:validator/app/common/common.dart';
import 'package:validator/controllers/controllers.dart';
import 'package:validator/models/saved_vaults_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class VaultsRepository {
  static SavedVaultsModel get _savedVaultsModel {
    String jsonStr = GetStorage().read(AppStorageKeys.vaultsList);

    if (jsonStr.isNullOrBlank) {
      return SavedVaultsModel.empty();
    }
    return SavedVaultsModel.fromJson(json.decode(jsonStr));
  }

  static List<Vault> get savedVaultsList => _savedVaultsModel.vaults;

  static List<String> get savedApiKeys =>
      savedVaultsList.map((v) => v.apiKey).toList();

  static Vault getVaultByKey(String key) =>
      savedVaultsList.firstWhere((v) => v.apiKey == key, orElse: () => null);

  static Future<void> updateVault(Vault newVault) async {
    final model = _savedVaultsModel;

    int vaultIndex = model.vaults.indexWhere(
      (element) => element.apiKey == newVault.apiKey,
    );

    if (vaultIndex < 0) {
      model.vaults.add(newVault);
    } else {
      model.vaults[vaultIndex] = newVault;
    }

    await GetStorage().write(
      AppStorageKeys.vaultsList,
      json.encode(model.toJson()),
    );
  }

  static Future<void> deleteVaultByKey(String apiKey) async {
    final model = _savedVaultsModel;

    model.vaults.removeWhere((v) => v.apiKey == apiKey);

    await GetStorage().write(
      AppStorageKeys.vaultsList,
      json.encode(model.toJson()),
    );
  }

  static void expireVault(String expiredApiKey) {
    var vault = getVaultByKey(expiredApiKey);
    if (vault != null) {
      Get.defaultDialog(
        barrierDismissible: false,
        title: 'Vault expired',
        middleText:
            'Oops.. One of your vaults named "${vault.localName}" will be removed',
        buttonColor: AppColors.dark,
        confirmTextColor: AppColors.primary,
        textConfirm: 'Accept',
        onConfirm: () => Get.back(),
      );
      VaultsRepository.deleteVaultByKey(vault.apiKey).whenComplete(
        () => VaultsController.con.reloadVaults(),
      );
    }
  }
}
