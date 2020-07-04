import 'package:KeyKeeperApp/controller/home/home_controller.dart';
import 'package:KeyKeeperApp/services/crypto/asymmetric_encryption_service.dart';
import 'package:KeyKeeperApp/services/crypto/symmetric_encryption_service.dart';
import 'package:KeyKeeperApp/services/local_auth_service.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  dependencies() {
    Get.lazyPut<AsymmetricEncryptionService>(
      () => AsymmetricEncryptionService(),
    );
    Get.lazyPut<SymmetricEncryptionService>(
      () => SymmetricEncryptionService(),
    );
    Get.lazyPut<LocalAuthService>(() => LocalAuthService());
    Get.put(HomeController());
  }
}
