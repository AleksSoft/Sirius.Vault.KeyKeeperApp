import 'package:KeyKeeperApp/services/api/api_service.dart';
import 'package:KeyKeeperApp/services/crypto/asymmetric_encryption_service.dart';
import 'package:KeyKeeperApp/services/crypto/symmetric_encryption_service.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  dependencies() {
    Get.lazyPut<AsymmetricEncryptionService>(
      () => AsymmetricEncryptionService(),
      fenix: true,
    );
    Get.lazyPut<SymmetricEncryptionService>(
      () => SymmetricEncryptionService(),
      fenix: true,
    );
    Get.put<ApiService>(ApiService());
  }
}
