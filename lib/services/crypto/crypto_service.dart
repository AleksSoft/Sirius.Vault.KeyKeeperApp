import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:validator/app/common/app_storage_keys.dart';
import 'package:crypto/crypto.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pointycastle/export.dart' as pointy;
import 'package:crypton/crypton.dart';
import 'package:flutter/material.dart';
import 'package:steel_crypt/steel_crypt.dart';

class CryptoService {
  static const int publicExponent = 3;
  static const int strength = 1024;
  static const int certainty = 25;

  static const int keyBitSize = 256;
  static const int macBitSize = 128;
  static const int nonceBitSize = 128;

  final _storage = GetStorage();

  /// get validator id from RSA publc key
  Future<String> get validatorId async {
    var key = await rsaPublicKey;
    var bytes = utf8.encode(key.toPEM());
    return sha256Hash(bytes);
  }

  /// get generated RSA private key
  Future<RSAPrivateKey> get rsaPrivateKey async =>
      (await rsaKeyPair).privateKey;

  /// get generated RSA public key
  Future<RSAPublicKey> get rsaPublicKey async => (await rsaKeyPair).publicKey;

  /// get generated RSA key pair
  Future<RSAKeypairSir> get rsaKeyPair async {
    var privateKeyValue = _storage.read(AppStorageKeys.privateKey);
    if (GetUtils.isNullOrBlank(privateKeyValue)) {
      var keyPair = _createKeyPair();
      await _storage.write(
        AppStorageKeys.privateKey,
        keyPair.privateKey.toPEM(),
      );
      return keyPair;
    } else {
      return RSAKeypairSir(RSAPrivateKey.fromPEM(privateKeyValue));
    }
  }

  /// get random key for AES
  String get randKey => CryptKey().genFortuna();

  /// get random iv for AES
  String get randNonce => CryptKey().genDart(len: nonceBitSize ~/ 8);

  /// encrypt data with AES algorythm
  String aesEncrypt(String input, String nonce, String keyStr) {
    var aes = AesCrypt(key: keyStr, padding: PaddingAES.pkcs7);
    var encrypted = aes.cbc.encrypt(inp: input, iv: nonce);
    return encrypted;
  }

  /// decrypt encrypted data with AES algorythm
  String aesDecrypt(String input, String nonce, String keyStr) {
    var aes = AesCrypt(key: keyStr, padding: PaddingAES.pkcs7);
    var decrypted = aes.cbc.decrypt(enc: input, iv: nonce);
    return decrypted;
  }

  /// get bytes sha256 hash
  String sha256Hash(Uint8List bytes) {
    var sha256Digest = sha256.convert(bytes);
    return base64.encode(sha256Digest.bytes);
  }

  RSAKeypair _createKeyPair() => RSAKeypairSir.fromParameters(
        keyParams: pointy.RSAKeyGeneratorParameters(
          BigInt.from(publicExponent),
          strength,
          certainty,
        ),
      );
}

/// [Keypair] using RSA Algorithm
class RSAKeypairSir implements RSAKeypair {
  RSAPrivateKey _privateKey;
  RSAPublicKey _publicKey;

  RSAKeypairSir(this._privateKey)
      : _publicKey = RSAPublicKey(
          _privateKey.asPointyCastle.modulus,
          BigInt.from(CryptoService.publicExponent),
        );

  RSAKeypairSir.fromParameters({
    @required pointy.RSAKeyGeneratorParameters keyParams,
  }) {
    var fortunaRandom = pointy.FortunaRandom();
    var random = Random.secure();
    var seeds = <int>[];
    for (var i = 0; i < 32; i++) {
      seeds.add(random.nextInt(255));
    }
    fortunaRandom.seed(pointy.KeyParameter(Uint8List.fromList(seeds)));

    var randomParams = pointy.ParametersWithRandom(keyParams, fortunaRandom);
    var generator = pointy.RSAKeyGenerator();
    generator.init(randomParams);

    var pair = generator.generateKeyPair();
    pointy.RSAPublicKey publicKey = pair.publicKey;
    pointy.RSAPrivateKey privateKey = pair.privateKey;

    _publicKey = RSAPublicKey(publicKey.modulus, publicKey.exponent);
    _privateKey = RSAPrivateKey(
      privateKey.modulus,
      privateKey.exponent,
      privateKey.p,
      privateKey.q,
    );
  }

  /// Get the [RSAPublicKey] associated [RSAPrivateKey]
  @override
  RSAPrivateKey get privateKey => _privateKey;

  /// Get the [RSAPrivateKey] associated [RSAPublicKey]
  @override
  RSAPublicKey get publicKey => _publicKey;
}
