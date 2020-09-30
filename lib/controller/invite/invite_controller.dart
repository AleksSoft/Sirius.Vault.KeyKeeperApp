import 'dart:convert';

import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:KeyKeeperApp/controller/vaults/vaults_controller.dart';
import 'package:KeyKeeperApp/models/saved_vaults_model.dart';
import 'package:KeyKeeperApp/repositories/invites_repository.dart';
import 'package:KeyKeeperApp/repositories/vaults_repository.dart';
import 'package:KeyKeeperApp/services/crypto/rsa_service.dart';
import 'package:KeyKeeperApp/services/device_info_service.dart';
import 'package:KeyKeeperApp/src/api.pb.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InviteController extends GetxController {
  static InviteController get con => Get.find();

  final _rsaService = Get.find<RSAService>();
  final _repository = InvitesRepository();

  final inviteCodeController = TextEditingController();
  final vaultNameController = TextEditingController();

  bool get submitAllowed =>
      !inviteCodeController.text.isNullOrBlank &&
      !vaultNameController.text.isNullOrBlank;

  Future<void> submitCode() async {
    var validatorId = await _rsaService.validatorId;
    var publicKeyPem = (await _rsaService.publicKey).toPEM();
    String deviceInfo = await DeviceInfoService.deviceInfo;

    var response = await _repository.accept(
      publicKeyPem: publicKeyPem,
      validatorId: validatorId,
      deviceInfo: deviceInfo,
      inviteId: inviteCodeController.text,
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
    await VaultsRepository.saveNewVault(Vault()
      ..localName = vaultNameController.text
      ..name = response.name
      ..apiKey = response.apiKey
      ..position = response.position
      ..description = response.description);
    await VaultsController.con.loadVaults();
  }
}
