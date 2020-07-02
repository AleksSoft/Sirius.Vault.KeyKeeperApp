import 'package:KeyKeeperApp/services/crypto/asymmetric_encryption_service.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  dependencies() {
    Get.lazyPut<AsymmetricEncryptionService>(
      () => AsymmetricEncryptionService(),
    );
  }
}
