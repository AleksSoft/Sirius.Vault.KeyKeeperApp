import 'dart:convert';
import 'dart:typed_data';

import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:KeyKeeperApp/repositories/transfers_repository.dart';
import 'package:KeyKeeperApp/services/crypto/asymmetric_encryption_service.dart';
import 'package:KeyKeeperApp/services/device_info_service.dart';
import 'package:KeyKeeperApp/src/api.pb.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RequestsController extends GetxController {
  static RequestsController get con => Get.find();

  final _storage = GetStorage();
  final _repository = TransfersRepository();
  final _asymCryptoService = Get.find<AsymmetricEncryptionService>();

  var requests = <GetApprovalRequestsResponse_ApprovalRequest>[];

  @override
  void onReady() async {
    await loadRequests();
    super.onReady();
  }

  Future<void> loadRequests() async {
    String deviceInfoUID = await DeviceInfoService.uid;
    String token = _storage.read(AppStorageKeys.token);
    if (!deviceInfoUID.isNullOrBlank && !token.isNullOrBlank) {
      requests = await _repository.getApprovalRequests(
        deviceInfo: deviceInfoUID,
      );
      var privateKey = await _asymCryptoService.privateKey;
      // String decrypted = utf8.decode(
      //   privateKey.decryptData(Uint8List.fromList(requests.first.secretEnc)),
      // );
      // Uint8List s = base64.decode(
      //   'Y1hLuvDfQ4Dr71zIBYwcOPIfpzIMo+RWpgaY3A51s4xS1NeHcrWMCfMr4qq8d0mQbotx4g0UXu8Y4yTZSuYMeMW8ezjzGpbzV8aikk1Skc72OnmUuwt8/ns/HVQmMwYumn0VlKGiJMKiFOUHROUBC3D1bAv1L363qnu1Vmiifn8=',
      // );
      // Uint8List s = requests.first.secretEnc;
      Uint8List list = privateKey.decryptData(
        base64.decode(requests.first.secretEncBase64),
      );
      String decrypted = base64.encode(list);
      print('decrypted secret: $decrypted');
    }
    update();
  }
}
