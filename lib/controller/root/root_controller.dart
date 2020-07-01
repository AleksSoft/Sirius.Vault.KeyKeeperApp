import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:KeyKeeperApp/services/local_auth_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:KeyKeeperApp/ui/pages/home/home_page.dart';

class RootController extends GetxController {
  final _box = GetStorage();

  final _showUi = false.obs;

  get showUi => this._showUi.value;

  set showUi(value) => this._showUi.value = value;

  @override
  void onReady() {
    super.onReady();
    _showUi.value = true;
  }

  void checkAuth() async {
    if (!_box.hasData(AppStorageKeys.authenticated)) {
      bool authenticated = await Get.find<LocalAuthService>().authenticate();
      _box.writeInMemory(AppStorageKeys.authenticated, authenticated);
      Get.offNamed(HomePage.route);
    } else {
      Future.delayed(Duration(seconds: 1)).then(
        (_) => Get.offNamed(HomePage.route),
      );
    }
  }
}
