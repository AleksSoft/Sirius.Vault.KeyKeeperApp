import 'dart:convert';

import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:KeyKeeperApp/models/saved_vaults_model.dart';
import 'package:KeyKeeperApp/ui/pages/home/pages/vaults/detail/vault_detail_page.dart';
import 'package:KeyKeeperApp/ui/pages/home/pages/vaults/invite/invite_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class VaultsController extends GetxController {
  static VaultsController get con => Get.find();

  final _storage = GetStorage();

  var vaults = <Vault>[];

  @override
  void onReady() async {
    await loadVaults();
    super.onReady();
  }

  Future<void> loadVaults() async {
    _storage.remove(AppStorageKeys.vaultsList);
    var saved = _storage.read(AppStorageKeys.vaultsList);
    if (saved != null) {
      var vaultsModel = SavedVaultsModel.fromJson(json.decode(saved));
      vaults = vaultsModel?.vaults ?? [];
    } else {
      vaults = [];
    }
    update();
  }

  void openDetails() => Get.toNamed(VaultDetailPage.route);

  void openNewInvite() => Get.toNamed(InvitePage.route);
}
