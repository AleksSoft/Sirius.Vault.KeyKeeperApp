import 'package:KeyKeeperApp/ui/pages/local_auth/local_auth_page.dart';
import 'package:get/get.dart';
import 'package:KeyKeeperApp/ui/pages/home/home_page.dart';

class RootController extends GetxController {
  final _showUi = false.obs;

  get showUi => this._showUi.value;

  set showUi(value) => this._showUi.value = value;

  @override
  void onReady() {
    super.onReady();
    _showUi.value = true;
  }

  void checkAuth() async {
    var auth = await Get.toNamed(LocalAuthPage.route);
    if (auth) {
      Get.offNamed(HomePage.route);
    }
  }
}
