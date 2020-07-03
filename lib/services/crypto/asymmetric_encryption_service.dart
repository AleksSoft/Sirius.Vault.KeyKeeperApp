import 'package:crypton/crypton.dart';

class AsymmetricEncryptionService {
  static const int publicExponent = 3;
  static const int strength = 1024;
  static const int certainty = 25;

  RSAKeypair createKeys() => RSAKeypair.fromRandom(keySize: strength);

  RSAPrivateKey privateKeyFromPem(String pem) => RSAPrivateKey.fromPEM(pem);

  RSAPublicKey publicKeyFromPem(String pem) => RSAPublicKey.fromPEM(pem);
}
