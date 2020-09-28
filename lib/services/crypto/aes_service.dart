import 'package:steel_crypt/steel_crypt.dart';

class AESService {
  static const int keyBitSize = 256;
  static const int macBitSize = 128;
  static const int nonceBitSize = 128;

  String get randKey => CryptKey().genFortuna();

  String encrypt(String input, String nonce, String keyStr) {
    var aes = AesCrypt(key: keyStr, padding: PaddingAES.none);
    var encrypted = aes.gcm.encrypt(inp: input, iv: nonce);
    return encrypted;
  }

  String decrypt(String input, String nonce, String keyStr) {
    var aes = AesCrypt(key: keyStr, padding: PaddingAES.none);
    var decrypted = aes.gcm.decrypt(enc: input, iv: nonce);
    return decrypted;
  }
}
