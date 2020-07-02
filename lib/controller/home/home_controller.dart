import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:KeyKeeperApp/services/crypto/asymmetric_encryption_service.dart';
import 'package:KeyKeeperApp/services/crypto/symmetric_encryption_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final _asymCryptoService = Get.find<AsymmetricEncryptionService>();
  final _symCryptoService = Get.find<SymmetricEncryptionService>();
  final _box = GetStorage();

  final _secured = false.obs;

  get secured => this._secured.value;

  set secured(val) => this._secured.value = val;

  final _publicKey = ''.obs;

  get publicKey => this._publicKey.value;

  get publicEmpty => this._publicKey.value == '';

  final _idKey = ''.obs;

  get idKey => this._idKey.value;

  get idKeyEmpty => this._idKey.value == '';

  @override
  void onInit() {
    super.onInit();
    _obtainRSAKeyPair();
    _obtainIdKey();
  }

  void _obtainRSAKeyPair() async {
    if (!_box.hasData(AppStorageKeys.publicKey) ||
        !_box.hasData(AppStorageKeys.privateKey)) {
      // generate new key-pair
      var keyPair = await this._asymCryptoService.createKeys();
      // obtain keys
      _publicKey.value = _asymCryptoService.encodePublicKey(
        keyPair.publicKey,
      );
      var privateKey = _asymCryptoService.encodePrivateKey(
        keyPair.privateKey,
      );
      // write keys to storage
      _box.write(AppStorageKeys.publicKey, _publicKey.value);
      _box.write(AppStorageKeys.privateKey, privateKey);
    } else {
      // read previously created public key from storage
      _publicKey.value = _box.read(AppStorageKeys.publicKey);
    }
  }

  void _obtainIdKey() {
    if (!_box.hasData(AppStorageKeys.idKey)) {
      // generate id-key
      _idKey.value = _symCryptoService.generateKey;
      // write key to storage
      _box.write(AppStorageKeys.idKey, _idKey.value);
    } else {
      // read previously created api-key from storage
      _idKey.value = _box.read(AppStorageKeys.idKey);
    }
  }
}
