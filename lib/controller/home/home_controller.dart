import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:KeyKeeperApp/services/crypto/asymmetric_encryption_service.dart';
import 'package:KeyKeeperApp/services/crypto/symmetric_encryption_service.dart';
import 'package:KeyKeeperApp/ui/pages/key_keepers/key_keepers_page.dart';
import 'package:KeyKeeperApp/ui/pages/local_auth/local_auth_page.dart';
import 'package:KeyKeeperApp/ui/pages/vault_lists/vault_lists_page.dart';
import 'package:crypton/crypton.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final _asymCryptoService = Get.find<AsymmetricEncryptionService>();
  final _symCryptoService = Get.find<SymmetricEncryptionService>();
  final _box = GetStorage();

  final _secured = false.obs;

  get secured => _secured.value;

  set secured(val) => _secured.value = val;

  final _privateKey = ''.obs;

  final _publicKey = ''.obs;

  final _idKey = ''.obs;

  final _isAuth = false.obs;

  get key => _secured.value ? _publicKey.value : _idKey.value;

  get keyLocked => _secured.value && _isAuth.value;

  @override
  void onInit() {
    super.onInit();
    ever(_secured, checkAuth);
    _obtainRSAKeyPair();
    _obtainIdKey();
  }

  checkAuth(value) async {
    if (value) {
      var authorized = await Get.toNamed(LocalAuthPage.route);
      _isAuth.value = authorized;
    } else {
      _isAuth.value = false;
    }
  }

  openKeyPeekersPage() => Get.toNamed(KeyKeepersPage.route);

  void openVaultLists({bool vaults = false}) =>
      Get.toNamed(VaultListsPage.route, arguments: vaults);

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
    String encrypted = RSAPublicKey.fromPEM(_publicKey.value).encrypt('12345');
    String decrypted =
        RSAPrivateKey.fromPEM(_privateKey.value).decrypt(encrypted);
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
        'key: ${_idKey.value}\n'
        'encoded: $encrypted\n'
        'decoded: $decrypted\n');
  }
}
