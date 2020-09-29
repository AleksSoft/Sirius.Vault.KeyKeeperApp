import 'dart:convert';

import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:KeyKeeperApp/models/saved_vaults_model.dart';
import 'package:KeyKeeperApp/repositories/invites_repository.dart';
import 'package:KeyKeeperApp/services/crypto/rsa_service.dart';
import 'package:KeyKeeperApp/services/device_info_service.dart';
import 'package:KeyKeeperApp/src/api.pb.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InviteController extends GetxController {
  static InviteController get con => Get.find();

  final _storage = GetStorage();
  final _rsaService = Get.find<RSAService>();
  final _repository = InvitesRepository();

  final inviteCodeController = TextEditingController();
  final vaultNameController = TextEditingController();

  bool get submitAllowed =>
      !inviteCodeController.text.isNullOrBlank &&
      !vaultNameController.text.isNullOrBlank;

  Future<void> submitCode() async {
    var validatorId = await _rsaService.validatorId;
    String deviceInfo = await DeviceInfoService.deviceInfo;
    var response = await _repository.accept(
      validatorId: validatorId,
      deviceInfo: deviceInfo,
      inviteId: inviteCodeController.text,
    );
    if (response != null) saveNewVault(response);
  }

  Future<void> saveNewVault(AcceptResponse response) async {
    Vault vault = Vault()
      ..localName = vaultNameController.text
      ..name = response.name
      ..apiKey = response.apiKey
      ..position = response.position
      ..description = response.description;

    String jsonStr = _storage.read(AppStorageKeys.errorList);

    SavedVaultsModel model = jsonStr.isNullOrBlank
        ? SavedVaultsModel()
        : SavedVaultsModel.fromJson(json.decode(jsonStr));

    model.vaults.add(vault);

    await _storage.write(
      AppStorageKeys.vaultsList,
      json.encode(model.toJson()),
    );
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
}
