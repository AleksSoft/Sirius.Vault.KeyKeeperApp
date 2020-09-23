import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:KeyKeeperApp/services/crypto/asymmetric_encryption_service.dart';
import 'package:KeyKeeperApp/services/crypto/symmetric_encryption_service.dart';
import 'package:KeyKeeperApp/ui/pages/root/root_page.dart';
import 'package:crypton/crypton.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:share/share.dart';

class HomeController extends GetxController {
  static HomeController get con => Get.find();

  final _asymCryptoService = Get.find<AsymmetricEncryptionService>();
  final _symCryptoService = Get.find<SymmetricEncryptionService>();
  final _storage = GetStorage();

  String _privateKeyPem = '';
  String _publicKeyPem = '';
  String _idKeyPem = '';

  @override
  void onInit() {
    _obtainRSAKeyPair();
    _obtainIdKey();
    super.onInit();
  }

  void logout() => _storage.erase().then(
        (value) => Get.offAllNamed(RootPage.route),
      );

  void sharePublicKeyPem() {
    Share.share(_publicKeyPem);
  }

  void shareValidatorId() {
    var publicKey = RSAPublicKey.fromPEM(_publicKeyPem);
    Share.share(publicKey.toString());
  }

  void _obtainRSAKeyPair() async {
    if (!_storage.hasData(AppStorageKeys.publicKey) ||
        !_storage.hasData(AppStorageKeys.privateKey)) {
      // generate new key-pair
      var keyPair = _asymCryptoService.createKeys();
      // obtain keys
      _publicKeyPem = keyPair.publicKey.toFormattedPEM();
      _privateKeyPem = keyPair.privateKey.toFormattedPEM();
      // write keys to storage
      _storage.write(AppStorageKeys.publicKey, _publicKeyPem);
      _storage.write(AppStorageKeys.privateKey, _privateKeyPem);
    } else {
      // read previously created public keys from storage
      _publicKeyPem = _storage.read(AppStorageKeys.publicKey);
      _privateKeyPem = _storage.read(AppStorageKeys.privateKey);
    }
    String encrypted = RSAPublicKey.fromPEM(_publicKeyPem).encrypt('12345');
    String decrypted = RSAPrivateKey.fromPEM(_privateKeyPem).decrypt(encrypted);
    print('\n\n----RSA----\n');
    print('publicKey: $_publicKeyPem\n');
    print('privateKey: $_privateKeyPem\n\n');
    print('encoded: $encrypted\n');
    print('decoded: $decrypted\n');
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
