import 'package:KeyKeeperApp/ui/pages/home/pages/vaults/detail/vault_detail_page.dart';
import 'package:KeyKeeperApp/ui/pages/home/pages/vaults/invite/invite_page.dart';
import 'package:get/get.dart';

class VaultsController extends GetxController {
  static VaultsController get con => Get.find();

  var vaults = <String>[];

  @override
  void onReady() async {
    await loadVaults();
    super.onReady();
  }

  Future<void> loadVaults() async {}

  void openDetails() => Get.toNamed(VaultDetailPage.route);

  void openNewInvite() => Get.toNamed(InvitePage.route);
}
