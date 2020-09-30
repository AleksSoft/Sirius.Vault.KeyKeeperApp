import 'package:steel_crypt/steel_crypt.dart';

class AESService {
  static const int keyBitSize = 256;
  static const int macBitSize = 128;
  static const int nonceBitSize = 128;

  String get randKey => CryptKey().genFortuna();

  String encrypt(String input, String nonce, String keyStr) {
    var aes = AesCrypt(key: keyStr, padding: PaddingAES.pkcs7);
    var encrypted = aes.cbc.encrypt(inp: input, iv: nonce);
    return encrypted;
  }

  String decrypt(String input, String nonce, String keyStr) {
    var aes = AesCrypt(key: keyStr, padding: PaddingAES.pkcs7);
    var decrypted = aes.cbc.decrypt(enc: input, iv: nonce);
    return decrypted;
  }
}
