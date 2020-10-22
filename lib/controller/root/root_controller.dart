import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:validator/app/common/app_storage_keys.dart';
import 'package:validator/app/utils/utils.dart';
import 'package:validator/repositories/version_repository.dart';
import 'package:validator/ui/pages/home/home_page.dart';
import 'package:validator/ui/pages/local_auth/local_auth_page.dart';
import 'package:validator/ui/pages/register/register_page.dart';

class RootController extends GetxController {
  static RootController get con => Get.find();

  final _config = Get.find<AppConfig>();
  final _versionRepo = VersionRepository();
  final _storage = GetStorage();

  final _versionOk = true.obs;
  bool get versionOk => this._versionOk.value;
  set versionOk(bool value) => this._versionOk.value = value;

  final _showUi = false.obs;
  bool get showUi => this._showUi.value;
  set showUi(bool value) => this._showUi.value = value;

  AppConfig get appConfig => _config;

  @override
  void onInit() async {
    await initialPreload();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    showUi = true;
  }

  Future<void> initialPreload() async {
    // check if app works with proper api version
    final version = await _versionRepo.getCurrentVersion();
    versionOk = version != null &&
        version.major == appConfig.version.major &&
        version.minor == appConfig.version.minor;
  }

  Future<void> checkAuth() async {
    bool hasPin = !GetUtils.isNullOrBlank(
      _storage.read(AppStorageKeys.pinCode),
    );
    var auth = await Get.to(
      LocalAuthPage(isCreatePin: !hasPin, isCloseVisible: !hasPin),
      fullscreenDialog: true,
    );
    if (auth ?? false) {
      final pKey = _storage.read(AppStorageKeys.privateKey);
      if (GetUtils.isNullOrBlank(pKey)) {
        await Get.toNamed(RegisterPage.route);
      }
      Get.offAllNamed(HomePage.route);
    }
  }
}
