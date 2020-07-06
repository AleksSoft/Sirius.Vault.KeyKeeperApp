import 'package:KeyKeeperApp/controller/key_keepers/key_keepers_controller.dart';
import 'package:KeyKeeperApp/services/api_service.dart';
import 'package:get/get.dart';

class KeyKeepersBinding extends Bindings {
  @override
  dependencies() {
    Get.lazyPut<ApiService>(() => ApiService());
    Get.put(KeyKeepersController());
  }
}
