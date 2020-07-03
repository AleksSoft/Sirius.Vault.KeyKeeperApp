import 'dart:convert';
import 'dart:typed_data';

import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:get_storage/get_storage.dart';
import 'package:steel_crypt/PointyCastleN/export.dart';

import 'secure_random.dart';

class SymmetricEncryptionService {
  static const int keyBitSize = 256;
  static const int macBitSize = 128;
  static const int nonceBitSize = 128;

  static final _box = GetStorage();

  String encrypt(String input, String keyStr) {
    final Uint8List data = utf8.encode(input) as Uint8List;
    final Uint8List key = base64Decode(keyStr);

    if (data == null) throw Exception('DataNull');
    if (key == null) throw Exception('KeyNull');
    if (data.length == 0) throw Exception('DataLength0');
    if (key.length == 0) throw Exception('KeyLength0');
    if (key.length != keyBitSize / 8) throw Exception('KeyLength0');

    var nonce = RandomKey(nonceBitSize ~/ 8).bytes;
    _box.write(AppStorageKeys.idKeyNonce, base64.encode(nonce));

    var parameters = AEADParameters(KeyParameter(key), macBitSize, nonce, null);
    var cipher = GCMBlockCipher(AESFastEngine());
    cipher..init(true, parameters);

    var encrypted = cipher.process(data);

    return base64Encode(encrypted);
  }

  String decrypt(String input, String keyStr) {
    final Uint8List data = base64Decode(input);
    final Uint8List key = base64Decode(keyStr);

    if (data == null) throw Exception('DataNull');
    if (key == null) throw Exception('KeyNull');
    if (data.length == 0) throw Exception('DataLength0');
    if (key.length == 0) throw Exception('KeyLength0');
    if (key.length != keyBitSize ~/ 8) throw Exception('KeyLength0');

    var nonce = base64Decode(_box.read(AppStorageKeys.idKeyNonce));

    var parameters = AEADParameters(KeyParameter(key), macBitSize, nonce, null);
    var cipher = GCMBlockCipher(AESFastEngine());
    cipher..init(false, parameters);

    var decrypted = cipher.process(data);

    return base64Encode(decrypted);
  }

  String generateKey() {
    var key = RandomKey(keyBitSize ~/ 8).bytes;
    key.last &= 0x7F;
    return base64Encode(key);
  }
}
