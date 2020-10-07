import 'package:KeyKeeperApp/services/crypto/crypto_service.dart';
import 'package:KeyKeeperApp/services/utils/dialog_manager.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  dependencies() {
    Get.lazyPut<CryptoService>(() => CryptoService(), fenix: true);
    Get.put<DialogManager>(DialogManager());
  }
}
