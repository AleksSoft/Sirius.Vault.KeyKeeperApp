import 'package:KeyKeeperApp/services/crypto/rsa_service.dart';
import 'package:KeyKeeperApp/ui/pages/home/pages/requests/requests_page.dart';
import 'package:KeyKeeperApp/ui/pages/root/root_page.dart';
import 'package:KeyKeeperApp/ui/widgets/menu_page.dart';
import 'package:crypton/crypton.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:share/share.dart';

class HomeController extends GetxController {
  static HomeController get con => Get.find();

  final _rsaService = Get.find<RSAService>();
  final _storage = GetStorage();

  RSAPublicKey _publicKey;
  String _validatorId;

  MenuPage _selectedPage = RequestsPage();
  MenuPage get selectedPage => _selectedPage;
  set selectedPage(MenuPage value) {
    if (value != _selectedPage) {
      _selectedPage = value;
      update();
      Get.back();
    }
  }

  @override
  void onInit() async {
    _publicKey = await _rsaService.publicKey;
    _validatorId = await _rsaService.validatorId;
    super.onInit();
  }

  void logout() => _storage.erase().whenComplete(
        () => Get.offAllNamed(RootPage.route),
      );

  void sharePublicKeyPem() => Share.share(_publicKey.toPEM());

  void shareValidatorId() => Share.share(_validatorId);
}
