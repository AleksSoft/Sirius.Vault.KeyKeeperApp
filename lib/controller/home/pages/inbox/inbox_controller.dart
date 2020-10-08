import 'package:KeyKeeperApp/repositories/invites_repository.dart';
import 'package:KeyKeeperApp/repositories/vaults_repository.dart';
import 'package:KeyKeeperApp/services/crypto/crypto_service.dart';
import 'package:KeyKeeperApp/services/device_info_service.dart';
import 'package:KeyKeeperApp/src/api.pb.dart';
import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:get/get.dart';

class InboxController extends GetxController {
  static InboxController get con => Get.find();

  final _crypto = Get.find<CryptoService>();
  final _repository = InvitesRepository();

  RSAKeypairSir _keyPair;

  var messages = <String>[];

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    if (loading != value) {
      _loading = value;
      update();
    }
  }

  bool get showEmptyContidion =>
      (messages == null || messages.isEmpty) && !loading;

  @override
  void onInit() async {
    _keyPair = await _crypto.rsaKeyPair;
    super.onInit();
  }

  Future<void> reload() async {
    loading = true;
    String deviceInfoUID = await DeviceInfoService.deviceInfo;
    messages.clear();
    for (String apiKey in VaultsRepository.savedApiKeys) {
      var ping = await _repository.getPing(
        deviceInfo: deviceInfoUID,
        apiKey: apiKey,
      );
      var decrypted = _decrypt(ping);
      if (decrypted != null) messages.add(decrypted);
    }
    loading = false;
  }

  void copy(String value) =>
      ClipboardManager.copyToClipBoard(value).then((result) {
        if (Get.isSnackbarOpen) Get.back();
        Get.rawSnackbar(
          message: '$value copied to clipboard',
          snackStyle: SnackStyle.GROUNDED,
        );
      });

  String _decrypt(PingResponse ping) {
    try {
      // TODO: server says it's not implemented so skipping
      // bool signatureVerified = _keyPair.publicKey.verifySHA256Signature(
      //   base64.decode(ping.messageEnc),
      //   base64.decode(ping.signatureMessage),
      // );

      // if (signatureVerified) {
      final message = _keyPair.privateKey.decrypt(ping.messageEnc);
      if (message.isNullOrBlank) return null;
      return message;
      // } else {
      //   return null;
      // }
    } catch (e) {
      return null;
    }
  }
}
