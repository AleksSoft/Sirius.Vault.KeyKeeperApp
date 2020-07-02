import 'dart:typed_data';

import 'package:pointycastle/pointycastle.dart';

class SymmetricEncryptionService {
  static const int keyBitSize = 256;
  static const int macBitSize = 128;
  static const int nonceBitSize = 128;

  final SecureRandom _random = SecureRandom();

  Uint8List encode(Uint8List data, Uint8List key) {
    if (data == null) throw Exception('DataNull');
    if (key == null) throw Exception('KeyNull');
    if (data.length == 0) throw Exception('DataLength0');
    if (data.length == 0) throw Exception('KeyLength0');
    if (key.length != keyBitSize / 8) throw Exception('KeyLengthDiffBitSize');

    var nonce = new Uint8List((nonceBitSize / 8) as int);

    // _random.nextBytes();

    // var cipher = Cipher
  }
}
