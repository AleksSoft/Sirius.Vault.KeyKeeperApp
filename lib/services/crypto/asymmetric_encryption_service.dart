import 'package:KeyKeeperApp/services/crypto/rsa_key_helper.dart';
import 'package:pointycastle/pointycastle.dart';

class AsymmetricEncryptionService {
  final RsaKeyHelper _keyHelper = RsaKeyHelper();

  Future<AsymmetricKeyPair<PublicKey, PrivateKey>> createKeys() async {
    return await _keyHelper.computeRSAKeyPair(
      _keyHelper.getSecureRandom(),
    );
  }

  String encodePublicKey(RSAPublicKey key) {
    return _keyHelper.encodePublicKeyToPemPKCS1(key);
  }

  String encodePrivateKey(RSAPrivateKey key) {
    return _keyHelper.encodePrivateKeyToPemPKCS1(key);
  }
}
