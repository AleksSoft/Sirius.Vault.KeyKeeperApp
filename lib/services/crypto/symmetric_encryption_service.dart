import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:get_storage/get_storage.dart';
import 'package:steel_crypt/steel_crypt.dart';

class SymmetricEncryptionService {
  static const int keyBitSize = 256;
  static const int macBitSize = 128;
  static const int nonceBitSize = 128;

  static final _box = GetStorage();

  String encrypt(String input, String keyStr) {
    var nonce = CryptKey().genFortuna(len: 16);
    _box.write(AppStorageKeys.idKeyNonce, nonce);
    var aes = AesCrypt(key: keyStr, padding: PaddingAES.none);
    var encrypted = aes.gcm.encrypt(inp: input, iv: nonce);
    return encrypted;
  }

  String decrypt(String input, String keyStr) {
    var nonce = _box.read(AppStorageKeys.idKeyNonce);
    var aes = AesCrypt(key: keyStr, padding: PaddingAES.none);
    var decrypted = aes.gcm.decrypt(enc: input, iv: nonce);
    return decrypted;
  }

  String generateKey() => CryptKey().genFortuna(len: 32);
}
