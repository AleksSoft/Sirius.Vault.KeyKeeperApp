import 'dart:convert';

import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:KeyKeeperApp/controller/transfer_detail/transfer_detail_controller.dart';
import 'package:KeyKeeperApp/models/transfer_detail_model.dart';
import 'package:KeyKeeperApp/repositories/transfers_repository.dart';
import 'package:KeyKeeperApp/services/crypto/aes_service.dart';
import 'package:KeyKeeperApp/services/crypto/rsa_service.dart';
import 'package:KeyKeeperApp/services/device_info_service.dart';
import 'package:KeyKeeperApp/src/api.pb.dart';
import 'package:KeyKeeperApp/ui/pages/transfer_detail/transfer_detail_page.dart';
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

  var requests = <TransferDetailArgs>[];

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

  void openDetails(TransferDetailArgs args) =>
      Get.toNamed(TransferDetailPage.route, arguments: args);

  TransferDetailArgs _buildTransferDetail(
    GetApprovalRequestsResponse_ApprovalRequest request,
  ) {
    String secretKey = base64.encode(
      _privateKey.decryptData(base64.decode(request.secretEncBase64)),
    );
    String decryptedJson = _aesService.decrypt(
      request.transactionDetailsEncBase64,
      request.ivNonce,
      secretKey,
    );
    return TransferDetailArgs(
      TransferDetailModel.fromJson(json.decode(decryptedJson)),
      request.transferSigningRequestId,
      secretKey,
      request.ivNonce,
    );
  }
}
