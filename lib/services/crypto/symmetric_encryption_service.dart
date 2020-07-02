import 'package:steel_crypt/steel_crypt.dart';

class SymmetricEncryptionService {
  static const int keyBitSize = 256;
  static const int macBitSize = 128;
  static const int nonceBitSize = 128;

  static aesEncrypter(String key) => AesCrypt(
        mode: ModeAES.gcm,
        padding: PaddingAES.none,
        key: key,
      );

  static final nonce = CryptKey().genDart(length: (nonceBitSize / 8) as int);

  String get generateKey => CryptKey().genFortuna();

  String encode(String data, String key) =>
      aesEncrypter(key).encrypt(data, iv: nonce);

  String decode(String data, String key) =>
      aesEncrypter(key).decrypt(data, iv: nonce);
}
