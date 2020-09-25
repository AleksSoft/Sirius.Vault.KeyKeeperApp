import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:KeyKeeperApp/services/crypto/asymmetric_encryption_service.dart';
import 'package:KeyKeeperApp/services/crypto/symmetric_encryption_service.dart';
import 'package:KeyKeeperApp/ui/pages/root/root_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:share/share.dart';

class HomeController extends GetxController {
  static HomeController get con => Get.find();

  final _asymCryptoService = Get.find<AsymmetricEncryptionService>();
  final _symCryptoService = Get.find<SymmetricEncryptionService>();
  final _storage = GetStorage();

  RSAKeypairSir _keyPair;
  String _idKeyPem = '';

  @override
  void onInit() async {
    _keyPair = await _asymCryptoService.keyPair;
    _obtainIdKey();
    super.onInit();
  }

  void logout() => _storage.erase().whenComplete(
        () => Get.offAllNamed(RootPage.route),
      );

  void sharePublicKeyPem() {
    Share.share(_keyPair.publicKey.toPEM());
  }

  void shareValidatorId() {
    Share.share(_keyPair.publicKey.toString());
  }

  void _obtainIdKey() {
    if (!_storage.hasData(AppStorageKeys.idKey)) {
      // generate id-key
      _idKeyPem = _symCryptoService.generateKey();
      // write key to storage
      _storage.write(AppStorageKeys.idKey, _idKeyPem);
    } else {
      // read previously created api-key from storage
      _idKeyPem = _storage.read(AppStorageKeys.idKey);
    }
    var encrypted = _symCryptoService.encrypt('12345', _idKeyPem);
    var decrypted = _symCryptoService.decrypt(encrypted, _idKeyPem);
    print('\n\n----AES----\n');
    print('key: $_idKeyPem\n\n');
    print('encoded: $encrypted\n');
    print('decoded: $decrypted\n');
  }
}
