import 'package:validator/app/utils/app_config.dart';
import 'package:validator/services/crypto/crypto_service.dart';
import 'package:validator/ui/pages/home/pages/requests/requests_page.dart';
import 'package:validator/ui/pages/local_auth/local_auth_page.dart';
import 'package:validator/ui/pages/root/root_page.dart';
import 'package:validator/ui/widgets/menu_page.dart';
import 'package:crypton/crypton.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info/package_info.dart';
import 'package:share/share.dart';

class HomeController extends GetxController {
  static HomeController get con => Get.find();

  final _config = Get.find<AppConfig>();
  final _crypto = Get.find<CryptoService>();
  final _storage = GetStorage();

  RSAPublicKey _publicKey;
  String _validatorId;

  String appVersion = '';

  MenuPage _selectedPage = RequestsPage();
  MenuPage get selectedPage => _selectedPage;
  set selectedPage(MenuPage value) {
    if (value != _selectedPage) {
      _selectedPage = value;
      update();
      Get.back();
    }
  }

  AppConfig get appConfig => _config;

  @override
  void onInit() async {
    _publicKey = await _crypto.rsaPublicKey;
    _validatorId = await _crypto.validatorId;
    appVersion = await _appVersionString;
    super.onInit();
  }

  Future<String> get _appVersionString async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    return 'v$version ($buildNumber)';
  }

  void logout() => _storage.erase().whenComplete(
        () => Get.offAllNamed(RootPage.route),
      );

  void sharePublicKeyPem() => Share.share(_publicKey.toPEM());

  void shareValidatorId() => Share.share(_validatorId);

  Future<void> changePin() async {
    Get.to(LocalAuthPage(), fullscreenDialog: true).then((result) {
      if (result ?? false) {
        Get.to(
          LocalAuthPage(isCreatePin: true, isCloseVisible: false),
          fullscreenDialog: true,
        );
      }
    });
  }
}
