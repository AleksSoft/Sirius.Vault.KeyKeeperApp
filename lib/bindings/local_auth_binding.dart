import 'package:KeyKeeperApp/controller/local_auth/local_auth_controller.dart';
import 'package:KeyKeeperApp/services/local_auth_service.dart';
import 'package:get/get.dart';

class LocalAuthBinding extends Bindings {
  @override
  dependencies() {
    Get.lazyPut<LocalAuthService>(() => LocalAuthService());
    Get.put(LocalAuthController());
  }
}
