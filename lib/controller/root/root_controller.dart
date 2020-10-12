import 'package:validator/app/common/app_storage_keys.dart';
import 'package:validator/ui/pages/local_auth/local_auth_page.dart';
import 'package:validator/ui/pages/register/register_page.dart';
import 'package:get/get.dart';
import 'package:validator/ui/pages/home/home_page.dart';
import 'package:get_storage/get_storage.dart';

class RootController extends GetxController {
  static RootController get con => Get.find();

  final _storage = GetStorage();

  final _showUi = false.obs;
  bool get showUi => this._showUi.value;
  set showUi(bool value) => this._showUi.value = value;

  @override
  void onReady() {
    super.onReady();
    showUi = true;
  }

  void checkAuth() async {
    bool hasPin = GetUtils.isNullOrBlank(
      _storage.read(AppStorageKeys.pinCode),
    );
    var auth = await Get.to(
      LocalAuthPage(isCreatePin: hasPin, isCloseVisible: !hasPin),
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
