import 'dart:convert';
import 'dart:typed_data';

import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:KeyKeeperApp/models/transfer_detail_model.dart';
import 'package:KeyKeeperApp/repositories/transfers_repository.dart';
import 'package:KeyKeeperApp/services/crypto/aes_service.dart';
import 'package:KeyKeeperApp/services/crypto/rsa_service.dart';
import 'package:KeyKeeperApp/services/device_info_service.dart';
import 'package:KeyKeeperApp/src/api.pb.dart';
import 'package:crypton/crypton.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RequestsController extends GetxController {
  static RequestsController get con => Get.find();

  final _storage = GetStorage();
  final _repository = TransfersRepository();
  final _rsaService = Get.find<RSAService>();
  final _aesService = Get.find<AESService>();

  RSAPrivateKey _privateKey;

  var requests = <TransferDetailModel>[];

  @override
  void onInit() async {
    _privateKey = await _rsaService.privateKey;
    super.onInit();
  }

  @override
  void onReady() async {
    await loadRequests();
    super.onReady();
  }

  Future<void> loadRequests() async {
    String deviceInfoUID = await DeviceInfoService.uid;
    String token = _storage.read(AppStorageKeys.token);
    if (!deviceInfoUID.isNullOrBlank && !token.isNullOrBlank) {
      var approvalRequests = await _repository.getApprovalRequests(
        deviceInfo: deviceInfoUID,
      );
      requests = approvalRequests.map((r) => _buildTransferDetail(r)).toList();
    }
    update();
  }

  TransferDetailModel _buildTransferDetail(
    GetApprovalRequestsResponse_ApprovalRequest request,
  ) {
    Uint8List list = _privateKey.decryptData(
      base64.decode(request.secretEncBase64),
    );
    String decryptedJson = _aesService.decrypt(
      request.transactionDetailsEncBase64,
      request.ivNonce,
      base64.encode(list),
    );
    return TransferDetailModel.fromJson(json.decode(decryptedJson));
  }
}
