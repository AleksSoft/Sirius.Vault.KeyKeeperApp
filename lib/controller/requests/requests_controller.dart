import 'dart:convert';
import 'dart:typed_data';

import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:KeyKeeperApp/repositories/transfers_repository.dart';
import 'package:KeyKeeperApp/services/crypto/aes_service.dart';
import 'package:KeyKeeperApp/services/crypto/rsa_service.dart';
import 'package:KeyKeeperApp/services/device_info_service.dart';
import 'package:KeyKeeperApp/src/api.pb.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RequestsController extends GetxController {
  static RequestsController get con => Get.find();

  final _storage = GetStorage();
  final _repository = TransfersRepository();
  final _rsaService = Get.find<RSAService>();
  final _aesService = Get.find<AESService>();

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
      var privateKey = await _rsaService.privateKey;

      Uint8List list = privateKey.decryptData(
        base64.decode(requests.first.secretEncBase64),
      );

      String decryptedJson = _aesService.decrypt(
        requests.first.transactionDetailsEncBase64,
        requests.first.ivNonce,
        base64.encode(list),
      );
      print('decrypted json: $decryptedJson');
    }
    update();
  }
}
