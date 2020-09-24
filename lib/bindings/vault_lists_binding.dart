import 'package:KeyKeeperApp/controller/vault_lists/vault_lists_controller.dart';
import 'package:get/get.dart';

class VaultListsBinding extends Bindings {
  @override
  dependencies() {
    Get.put(VaultListsController());
  }
}
