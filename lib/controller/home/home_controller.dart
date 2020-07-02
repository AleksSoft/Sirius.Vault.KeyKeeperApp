import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:KeyKeeperApp/services/crypto/asymmetric_encryption_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final _cryptoService = Get.find<AsymmetricEncryptionService>();
  final _box = GetStorage();

  final _publicKey = ''.obs;

  get publicKey => this._publicKey.value;

  get publicEmpty => this._publicKey.value == '';

  final _privateKey = ''.obs;

  get privateKey => this._privateKey.value;

  get privateEmpty => this._privateKey.value == '';

  @override
  void onInit() {
    super.onInit();
    _obtainRSAKeyPair();
  }

  void _obtainRSAKeyPair() async {
    if (!_box.hasData(AppStorageKeys.publicKey) ||
        !_box.hasData(AppStorageKeys.privateKey)) {
      // generate new key-pair
      var keyPair = await this._cryptoService.createKeys();
      // obtain keys
      _publicKey.value = _cryptoService.encodePublicKey(keyPair.publicKey);
      _privateKey.value = _cryptoService.encodePrivateKey(keyPair.privateKey);
      // write keys to storage
      _box.write(AppStorageKeys.publicKey, _publicKey.value);
      _box.write(AppStorageKeys.privateKey, _privateKey.value);
    } else {
      // read previously created keys from storage
      _publicKey.value = _box.read(AppStorageKeys.publicKey);
      _privateKey.value = _box.read(AppStorageKeys.privateKey);
    }
  }
}
