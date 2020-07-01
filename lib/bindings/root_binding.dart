import 'package:KeyKeeperApp/services/local_auth_service.dart';
import 'package:get/get.dart';

class RootBinding extends Bindings {
  @override
  dependencies() {
    Get.lazyPut<LocalAuthService>(() => LocalAuthService());
  }
}
