import 'package:KeyKeeperApp/ui/pages/local_auth/local_auth_page.dart';
import 'package:KeyKeeperApp/ui/pages/register/register_page.dart';
import 'package:get/get.dart';
import 'package:KeyKeeperApp/ui/pages/home/home_page.dart';

class RootController extends GetxController {
  static RootController get con => Get.find();

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
      await Get.toNamed(RegisterPage.route);
      Get.offAllNamed(HomePage.route);
    }
  }
}
