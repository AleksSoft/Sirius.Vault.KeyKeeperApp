import 'dart:convert';

import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:KeyKeeperApp/models/saved_vaults_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class VaultsRepository {
  static List<String> loadApiKeys() =>
      loadVaults().map((v) => v.apiKey).toList();

  static List<Vault> loadVaults() {
    final _storage = GetStorage();
    var saved = _storage.read(AppStorageKeys.vaultsList);
    if (saved != null) {
      var vaultsModel = SavedVaultsModel.fromJson(json.decode(saved));
      return vaultsModel?.vaults ?? [];
    } else {
      return [];
    }
  }

  static Future<void> saveNewVault(Vault vault) async {
    final _storage = GetStorage();
    String jsonStr = _storage.read(AppStorageKeys.errorList);

    SavedVaultsModel model = jsonStr.isNullOrBlank
        ? SavedVaultsModel()
        : SavedVaultsModel.fromJson(json.decode(jsonStr));

    model.vaults.add(vault);

    await _storage.write(
      AppStorageKeys.vaultsList,
      json.encode(model.toJson()),
    );
  }
}
