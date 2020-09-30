import 'package:KeyKeeperApp/models/saved_vaults_model.dart';
import 'package:KeyKeeperApp/repositories/vaults_repository.dart';
import 'package:KeyKeeperApp/ui/pages/home/pages/vaults/detail/vault_detail_page.dart';
import 'package:KeyKeeperApp/ui/pages/home/pages/vaults/invite/invite_page.dart';
import 'package:get/get.dart';

class VaultsController extends GetxController {
  static VaultsController get con => Get.find();

  var vaults = <Vault>[];

  @override
  void onReady() async {
    await loadVaults();
    super.onReady();
  }

  Future<void> loadVaults() async {
    vaults = VaultsRepository.loadVaults();
    update();
  }

  void openDetails(Vault vault) =>
      Get.toNamed(VaultDetailPage.route, arguments: vault);

  void openNewInvite() => Get.toNamed(InvitePage.route);
}
