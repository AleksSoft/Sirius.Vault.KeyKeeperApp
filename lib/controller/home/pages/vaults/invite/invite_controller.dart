import 'package:KeyKeeperApp/controller/controllers.dart';
import 'package:KeyKeeperApp/models/saved_vaults_model.dart';
import 'package:KeyKeeperApp/repositories/invites_repository.dart';
import 'package:KeyKeeperApp/repositories/vaults_repository.dart';
import 'package:KeyKeeperApp/services/crypto/crypto_service.dart';
import 'package:KeyKeeperApp/services/device_info_service.dart';
import 'package:KeyKeeperApp/src/api.pb.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InviteController extends GetxController {
  static InviteController get con => Get.find();

  final _crypto = Get.find<CryptoService>();
  final _repository = InvitesRepository();

  final inviteCodeController = TextEditingController();
  final vaultNameController = TextEditingController();

  bool get submitAllowed =>
      !inviteCodeController.text.isNullOrBlank &&
      !vaultNameController.text.isNullOrBlank;

  Future<void> submitCode() async {
    var validatorId = await _crypto.validatorId;
    var publicKeyPem = (await _crypto.rsaPublicKey).toPEM();
    String deviceInfo = await DeviceInfoService.deviceInfo;
    String inviteId = inviteCodeController.text.trim();

    var response = await _repository.accept(
      publicKeyPem: publicKeyPem,
      validatorId: validatorId,
      deviceInfo: deviceInfo,
      inviteId: inviteId,
    );

    if (response != null) await _saveNewVaultAndReload(response);
  }

  Future<void> scanQRCode() async {
    inviteCodeController.text = await getQrCodeValue();
    update();
  }

  Future<String> getQrCodeValue() async {
    var result = await BarcodeScanner.scan();
    if (result.type == ResultType.Barcode) {
      return result.rawContent;
    } else {
      return '';
    }
  }

  Future<void> _saveNewVaultAndReload(AcceptResponse response) async {
    await VaultsRepository.updateVault(Vault()
      ..localName = vaultNameController.text
      ..name = response.name
      ..apiKey = response.apiKey
      ..position = response.position
      ..description = response.description);
    await VaultsController.con.reloadVaults();
    Get.back();
  }
}
