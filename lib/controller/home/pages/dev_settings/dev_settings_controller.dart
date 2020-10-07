import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:KeyKeeperApp/services/api/api_service.dart';
import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DevSettingsController extends GetxController {
  static DevSettingsController get con => Get.find();

  final _api = Get.find<ApiService>();
  final _storage = GetStorage();

  String _firebaseToken = '';
  String get fbToken => _firebaseToken;

  List<String> get urlList => ApiService.urls;

  String get defaultUrl => _api.defaultUrl;

  @override
  void onInit() {
    _firebaseToken = _storage.read(AppStorageKeys.fcmToken) ?? '';
    super.onInit();
  }

  Future<void> updateDefaultUrl(String url) async {
    await _api.update(url: url);
    update();
  }

  void copy(String title, String value) =>
      ClipboardManager.copyToClipBoard(value).then((result) {
        if (Get.isSnackbarOpen) Get.back();
        Get.rawSnackbar(
          message: '$title copied to clipboard',
          snackStyle: SnackStyle.GROUNDED,
        );
      });
}
