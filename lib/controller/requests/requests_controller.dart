import 'dart:convert';

import 'package:KeyKeeperApp/controller/transfer_detail/transfer_detail_controller.dart';
import 'package:KeyKeeperApp/models/saved_vaults_model.dart';
import 'package:KeyKeeperApp/models/transfer_detail_model.dart';
import 'package:KeyKeeperApp/repositories/transfers_repository.dart';
import 'package:KeyKeeperApp/repositories/vaults_repository.dart';
import 'package:KeyKeeperApp/services/crypto/aes_service.dart';
import 'package:KeyKeeperApp/services/crypto/rsa_service.dart';
import 'package:KeyKeeperApp/services/device_info_service.dart';
import 'package:KeyKeeperApp/src/api.pb.dart';
import 'package:KeyKeeperApp/ui/pages/home/pages/requests/detail/transfer_detail_page.dart';
import 'package:crypton/crypton.dart';
import 'package:get/get.dart';

class RequestsController extends GetxController {
  static RequestsController get con => Get.find();

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
    String deviceInfoUID = await DeviceInfoService.deviceInfo;

    requests.clear();
    VaultsRepository.loadVaults().forEach((vault) async {
      var approvalRequests = await _repository.getApprovalRequests(
          deviceInfo: deviceInfoUID, apiKey: vault.apiKey);
      requests
          .addAll(approvalRequests.map((r) => _buildTransferDetail(r, vault)));
    });

    update();
  }

  void openDetails(TransferDetailArgs args) =>
      Get.toNamed(TransferDetailPage.route, arguments: args);

  TransferDetailArgs _buildTransferDetail(
    GetApprovalRequestsResponse_ApprovalRequest request,
    Vault vault,
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
      transferDetail: TransferDetailModel.fromJson(json.decode(decryptedJson)),
      transferSigningRequestId: request.transferSigningRequestId,
      aesSecretKey: secretKey,
      aesIvNonce: request.ivNonce,
      vault: vault,
    );
  }
}
