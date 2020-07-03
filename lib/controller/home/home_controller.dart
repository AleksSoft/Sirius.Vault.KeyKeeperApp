import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:KeyKeeperApp/services/crypto/asymmetric_encryption_service.dart';
import 'package:KeyKeeperApp/services/crypto/symmetric_encryption_service.dart';
import 'package:KeyKeeperApp/services/local_auth_service.dart';
import 'package:crypton/crypton.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final _asymCryptoService = Get.find<AsymmetricEncryptionService>();
  final _symCryptoService = Get.find<SymmetricEncryptionService>();
  final _localAuthService = Get.find<LocalAuthService>();
  final _box = GetStorage();

  final _secured = false.obs;

  get secured => this._secured.value;

  set secured(val) => this._secured.value = val;

  final _privateKey = ''.obs;

  get privateKey => this._privateKey.value;

  final _publicKey = ''.obs;

  get publicKey => this._publicKey.value;

  get showPublic => this._secured.value && this._isAuth.value;

  final _idKey = ''.obs;

  get idKey => this._idKey.value;

  get idKeyEmpty => this._idKey.value == '';

  final _isAuth = false.obs;

  @override
  void onInit() {
    super.onInit();
    _secured.listen((value) async {
      if (value) {
        _isAuth.value = await _localAuthService.authenticate();
      } else {
        _isAuth.value = false;
      }
    });
    _obtainRSAKeyPair();
    _obtainIdKey();
  }

  void _obtainRSAKeyPair() async {
    if (!_box.hasData(AppStorageKeys.publicKey) ||
        !_box.hasData(AppStorageKeys.privateKey)) {
      // generate new key-pair
      var keyPair = _asymCryptoService.createKeys();
      // obtain keys
      _publicKey.value = keyPair.publicKey.toFormattedPEM();
      _privateKey.value = keyPair.privateKey.toFormattedPEM();
      // write keys to storage
      _box.write(AppStorageKeys.publicKey, _publicKey.value);
      _box.write(AppStorageKeys.privateKey, _privateKey.value);
    } else {
      // read previously created public keys from storage
      _publicKey.value = _box.read(AppStorageKeys.publicKey);
      _privateKey.value = _box.read(AppStorageKeys.privateKey);
    }
    String encrypted = RSAPublicKey.fromPEM(publicKey).encrypt('12345');
    String decrypted = RSAPrivateKey.fromPEM(privateKey).decrypt(encrypted);
    print('decrypted = $decrypted');
  }

  void _obtainIdKey() {
    if (!_box.hasData(AppStorageKeys.idKey)) {
      // generate id-key
      _idKey.value = _symCryptoService.generateKey();
      // write key to storage
      _box.write(AppStorageKeys.idKey, _idKey.value);
    } else {
      // read previously created api-key from storage
      _idKey.value = _box.read(AppStorageKeys.idKey);
    }
    var encrypted = _symCryptoService.encrypt('12345', _idKey.value);
    var decrypted = _symCryptoService.decrypt(encrypted, _idKey.value);
    print('\n\n----AES----\n'
        'key: $idKey\n'
        'encoded: $encrypted\n'
        'decoded: $decrypted\n');
  }
}
