import 'package:validator/models/saved_vaults_model.dart';
import 'package:validator/repositories/vaults_repository.dart';
import 'package:validator/ui/pages/home/pages/vaults/detail/vault_detail_page.dart';
import 'package:validator/ui/pages/home/pages/vaults/invite/invite_page.dart';
import 'package:get/get.dart';

class VaultsController extends GetxController {
  static VaultsController get con => Get.find();

  var vaults = <Vault>[];

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    if (_loading != value) {
      _loading = value;
      update();
    }
  }

  bool get showEmptyContidion => (vaults == null || vaults.isEmpty) && !loading;

  @override
  void onReady() async {
    super.onReady();
    await reloadVaults();
  }

  Future<void> reloadVaults() async {
    loading = true;
    vaults = VaultsRepository.savedVaultsList;
    loading = false;
  }

  void openDetails(Vault vault) =>
      Get.toNamed(VaultDetailPage.route, arguments: vault);

  void openNewInvite() => Get.toNamed(InvitePage.route);
}
