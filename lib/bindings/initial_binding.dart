import 'package:KeyKeeperApp/services/api/api_service.dart';
import 'package:KeyKeeperApp/services/crypto/aes_service.dart';
import 'package:KeyKeeperApp/services/crypto/rsa_service.dart';
import 'package:KeyKeeperApp/services/utils/dialog_manager.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  dependencies() {
    Get.lazyPut<RSAService>(() => RSAService(), fenix: true);
    Get.lazyPut<AESService>(() => AESService(), fenix: true);
    Get.put<DialogManager>(DialogManager());
    Get.put<ApiService>(ApiService());
  }
}
