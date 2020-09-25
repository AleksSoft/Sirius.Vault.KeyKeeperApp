import 'dart:convert';

import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:KeyKeeperApp/repositories/transfers_repository.dart';
import 'package:KeyKeeperApp/services/device_info_service.dart';
import 'package:KeyKeeperApp/src/api.pb.dart';
import 'package:crypton/crypton.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RequestsController extends GetxController {
  static RequestsController get con => Get.find();

  final _storage = GetStorage();
  final _repository = TransfersRepository();

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
      var _privateKeyPem = _storage.read(AppStorageKeys.privateKey);
      var secret = base64Encode(requests.first.secretEnc);
      print(secret);
      String decrypted = RSAPrivateKey.fromPEM(_privateKeyPem).toString();
      print(decrypted);
    }
    update();
  }
}
