import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:validator/app/common/app_storage_keys.dart';
import 'package:validator/app/utils/utils.dart';
import 'package:validator/controllers/controllers.dart';
import 'package:validator/models/saved_vaults_model.dart';
import 'package:validator/repositories/invites_repository.dart';
import 'package:validator/repositories/vaults_repository.dart';
import 'package:validator/services/crypto/crypto_service.dart';
import 'package:validator/services/device_info_service.dart';
import 'package:validator/services/qr_service.dart';
import 'package:validator/src/api.pb.dart';

class InviteController extends GetxController {
  static InviteController get con => Get.find();

  final _storage = GetStorage();
  final _crypto = Get.find<CryptoService>();
  final _repository = InvitesRepository();

  final inviteCodeController = TextEditingController();
  final vaultNameController = TextEditingController();

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    if (_loading != value) {
      _loading = value;
      update();
    }
  }

  bool get submitAllowed =>
      !inviteCodeController.text.isNullOrBlank &&
      !vaultNameController.text.isNullOrBlank &&
      !loading;

  Future<void> submitCode() async {
    GestureUtils.unfocus();
    loading = true;

    var validatorId = await _crypto.validatorId;
    var publicKeyPem = (await _crypto.rsaPublicKey).toPEM();
    String deviceInfo = await DeviceInfoService.deviceInfo;
    String inviteId = inviteCodeController.text.trim();
    String fcmToken = _storage.read(AppStorageKeys.fcmToken) ?? '';

    AppLog.loggerNoStack.v('''
    ---- Accept Invite Code Request ----
    validatorId: $validatorId
    publicKeyPem: $publicKeyPem
    deviceInfo: $deviceInfo
    inviteId: $inviteId
    fcmToken: $fcmToken
    ''');

    var response = await _repository.accept(
      publicKeyPem: publicKeyPem,
      validatorId: validatorId,
      deviceInfo: deviceInfo,
      inviteId: inviteId,
      pushNotificationFCMToken: fcmToken,
    );

    if (response != null) await _saveNewVaultAndReload(response);

    loading = false;
  }

  Future<void> scanQRCode() async {
    inviteCodeController.text = await QrService.scan();
    update();
  }

  Future<void> _saveNewVaultAndReload(AcceptResponse response) async {
    AppLog.loggerNoStack
        .v('---- Accept Invite Code Response ----\n${response.toProto3Json()}');

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
