import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:validator/app/common/app_storage_keys.dart';
import 'package:validator/app/utils/utils.dart';
import 'package:validator/repositories/version_repository.dart';
import 'package:validator/ui/pages/home/home_page.dart';
import 'package:validator/ui/pages/local_auth/local_auth_page.dart';
import 'package:validator/ui/pages/register/register_page.dart';

enum ApiVersionStatus {
  ok,
  outdated,
  undefined,
}

class RootController extends GetxController {
  static RootController get con => Get.find();

  final _config = Get.find<AppConfig>();
  final _versionRepo = VersionRepository();
  final _storage = GetStorage();

  final _loading = false.obs;
  bool get loading => this._loading.value;
  set loading(bool value) => this._loading.value = value;

  final _versionOk = ApiVersionStatus.undefined.obs;
  ApiVersionStatus get versionStatus => this._versionOk.value;
  set versionStatus(ApiVersionStatus value) => this._versionOk.value = value;

  final _showUi = false.obs;
  bool get showUi => this._showUi.value;
  set showUi(bool value) => this._showUi.value = value;

  AppConfig get appConfig => _config;

  @override
  void onReady() {
    super.onReady();
    showUi = true;
  }

  Future<void> checkAuth() async {
    loading = true;
    versionStatus = await _checkApiVersionStatus();
    if (versionStatus == ApiVersionStatus.ok) {
      bool hasPin = !GetUtils.isNullOrBlank(
        _storage.read(AppStorageKeys.pinCode),
      );
      var auth = await Get.to(
        LocalAuthPage(isCreatePin: !hasPin, isCloseVisible: true),
        fullscreenDialog: true,
      );
      if (auth ?? false) {
        final pKey = _storage.read(AppStorageKeys.privateKey);
        if (GetUtils.isNullOrBlank(pKey)) {
          await Get.toNamed(RegisterPage.route);
        }
        Get.offAllNamed(HomePage.route);
      } else {
        await _storage.erase();
        Get.rawSnackbar(
          message: 'Local session cleared',
          snackStyle: SnackStyle.GROUNDED,
        );
      }
    }
    loading = false;
  }

  Future<ApiVersionStatus> _checkApiVersionStatus() async {
    final version = await _versionRepo.getCurrentVersion();
    bool statusOk = version != null &&
        version.major == appConfig.version.major &&
        version.minor == appConfig.version.minor;
    return statusOk ? ApiVersionStatus.ok : ApiVersionStatus.outdated;
  }
}
