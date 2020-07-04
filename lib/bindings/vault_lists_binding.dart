import 'package:KeyKeeperApp/controller/vault_lists/vault_lists_controller.dart';
import 'package:KeyKeeperApp/services/api_service.dart';
import 'package:KeyKeeperApp/services/local_auth_service.dart';
import 'package:get/get.dart';

class VaultListsBinding extends Bindings {
  @override
  dependencies() {
    Get.lazyPut<LocalAuthService>(() => LocalAuthService());
    Get.lazyPut<ApiService>(() => ApiService());
    Get.put(VaultListsController());
  }
}
