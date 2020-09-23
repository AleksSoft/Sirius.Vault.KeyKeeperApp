import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:KeyKeeperApp/ui/pages/local_auth/local_auth_page.dart';
import 'package:KeyKeeperApp/ui/pages/register/register_page.dart';
import 'package:get/get.dart';
import 'package:KeyKeeperApp/ui/pages/home/home_page.dart';
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
    _showUi.value = true;
  }

  void checkAuthRegister() async {
    var auth = await Get.toNamed(LocalAuthPage.route);
    if (auth) {
      if (!_storage.hasData(AppStorageKeys.appPrivateKey)) {
        await Get.toNamed(RegisterPage.route);
      }
      Get.offAllNamed(HomePage.route);
    }
  }
}
