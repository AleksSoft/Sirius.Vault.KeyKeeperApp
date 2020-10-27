import 'package:validator/app/utils/utils.dart';
import 'package:validator/controllers/local_auth/local_auth_controller.dart';
import 'package:validator/services/crypto/crypto_service.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  dependencies() {
    Get.lazyPut<CryptoService>(() => CryptoService(), fenix: true);
    Get.put<DialogManager>(DialogManager());
    Get.put<LocalAuthController>(LocalAuthController());
  }
}
