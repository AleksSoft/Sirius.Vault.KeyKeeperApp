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
    await reloadRequests();
    super.onReady();
  }

  Future<void> reloadRequests() async {
    String deviceInfoUID = await DeviceInfoService.deviceInfo;

    requests.clear();
    for (Vault vault in VaultsRepository.loadVaults()) {
      var approvalRequests = await _repository.getApprovalRequests(
          deviceInfo: deviceInfoUID, apiKey: vault.apiKey);
      var transferDetails = approvalRequests
          .map((r) => _buildTransferDetail(r, vault))
          .where((element) => element != null)
          .toList();
      requests.addAll(transferDetails);
    }
    update();

    // var privateKeyPem = _privateKey.toPEM();
    // var base64Secret = base64.decode(
    //     'HjxOaXVagd72jdJqdpgujYrWbMwxXdC3f1Hk9AO0/VN+M1rB7uqZQ1wGAWdVXLyFlqMQhqH+EBlng2H7YmfMAv8UXWZTFOtJhRBfZKuENsfql1yjTqoh5StXe3YhaUoQJBkuxZXnw8Hhaptckk8Kq1MyI4uM/6QNOjc5njMJm+g=');
    // var secretDecrypted = _privateKey.decryptData(base64Secret);
    // var secretDecryptedBase64 = base64.encode(secretDecrypted);

    // print('---- privateKeyPem: $privateKeyPem');
    // print('---- base64Secret: $base64Secret');
    // print('---- secretDecrypted: $secretDecrypted');
    // print('---- secretDecryptedBase64: $secretDecryptedBase64');

    // String decryptedJson = _aesService.decrypt(
    //   'CjjckdqhNsUuC2tpxUMveEi+2ewnheU05ZeM4Xcdxvg+OMjg+K1ymW85kDlxltvAJC3ylC+5eivOH5fnOhfqwM11/1Oqa0QYtzM+uSkBoeuE+UnRny1yWN9qv7m2gL9qvXhxgsLE7bxkvsYjihkDILsMYFwxE2qNXBOoRG1s8uwbekq9CjFdrVrxtj26+TgSoOyNQDwxotgauUK2eTjOJoDpG0fcvgyBryaFsUA7f9s75Xjc3dJf3ZLKU/GXljvkDIxwzE6gtp7yfH76x7icd05EKgF+lKQawtZkoQMTGMk8h2vBoL+fzXPJlXhaYFUh0Y+MWk3YBieTJlV9Pa4yfh0JXrnsx8wmdqhtXCPBEW8OmHIEuqXHwcVj2u9bmu/+a+bOQ9te+UVOFoqXULr1d6QDS1fW4EK6KTkQYbMwZDrBBIb+NDonP6QDek8nvdcuqJSyKULyT39syyojxcEJX75CnRd4oB/iDEaKft822Cm7nzNeL04iIwrFxILjXrezArRadYZ02pACO+wc+WsWs8iXH5XTcNAOxmmfOaJvCY0LSeyEVDjVnW+ebR0t6gS5cy3meaBE+BLqswYGxzSbrgqkaDT49mfCWVvnPMGCY4lKPw9uYuH4bbwawsjVrLguA78yGabc9uhtHHlgzBgFuyXfb6b0yLrq0zn7P8BCeXEdSwcHE1sbnnNckx75NhEMP7AvGbNUmxTg1VikkivIbPb8Jtl2S4WjfEW7y2/GC8mCSoofaeKF67GatbmSWcvba0Usv/kbNZOVs/hKsSAlKXLSygMoWg9hsFhImmisfFFchFPwjmdoIorZ0dgVOJSsc4oqERX9kS7tA9tEZ7xCdWnqSl5cBFAUpTyICHuyMgpYNgmHu8sck9mqV6tNCfMi9rzfyk25dzNwuQHmT6xeB3lFlML4PgSRHO/7vhqiRCd2vkyIr2CYh1M+Uwq9aSviLNRgq3rkUfdGn1oJCx7qbg==',
    //   'zcK58atDZhXgXcqs5DdTIA==',
    //   'Sbu9VBzfZPhrZDbUJ+5iH7zM1FW22eVwZ6f9rkiGnVU=',
    // );

    // print('----- decryptedJson: $decryptedJson');
  }

  void openDetails(TransferDetailArgs args) =>
      Get.toNamed(TransferDetailPage.route, arguments: args);

  TransferDetailArgs _buildTransferDetail(
    GetApprovalRequestsResponse_ApprovalRequest request,
    Vault vault,
  ) {
    try {
      var secretEncBase64 = base64.decode(request.secretEncBase64);
      var secretDecr = _privateKey.decryptData(secretEncBase64);
      String secretKey = base64.encode(secretDecr);

      String decryptedJson = _aesService.decrypt(
        request.transactionDetailsEncBase64,
        request.ivNonce,
        secretKey,
      );
      print('----- decryptedJson: $decryptedJson');

      return TransferDetailArgs(
        transferDetail: TransferDetailsModel.fromJson(
          json.decode(decryptedJson),
        ),
        transferSigningRequestId: request.transferSigningRequestId,
        aesSecretKey: secretKey,
        aesIvNonce: request.ivNonce,
        vault: vault,
      );
    } catch (e) {
      return null;
    }
  }
}
