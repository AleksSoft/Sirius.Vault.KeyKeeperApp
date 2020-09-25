import 'dart:math';
import 'dart:typed_data';

import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pointycastle/export.dart' as pointy;
import 'package:crypton/crypton.dart';
import 'package:flutter/material.dart';

class RSAService {
  static const int publicExponent = 3;
  static const int strength = 1024;
  static const int certainty = 25;

  final _storage = GetStorage();

  Future<RSAPrivateKey> get privateKey async => (await keyPair).privateKey;

  Future<RSAPublicKey> get publicKey async => (await keyPair).publicKey;

  Future<RSAKeypairSir> get keyPair async {
    if (!_storage.hasData(AppStorageKeys.privateKey)) {
      var keyPair = _createKeyPair();
      await _storage.write(
        AppStorageKeys.privateKey,
        keyPair.privateKey.toPEM(),
      );
      return keyPair;
    } else {
      return RSAKeypairSir(
        RSAPrivateKey.fromPEM(
          _storage.read(AppStorageKeys.privateKey),
        ),
      );
    }
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
          BigInt.from(RSAService.publicExponent),
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
