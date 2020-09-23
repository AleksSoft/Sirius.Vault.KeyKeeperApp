import 'package:KeyKeeperApp/bindings/home_binding.dart';
import 'package:KeyKeeperApp/bindings/key_keepers_binding.dart';
import 'package:KeyKeeperApp/bindings/vault_lists_binding.dart';
import 'package:KeyKeeperApp/ui/pages/home/home_page.dart';
import 'package:KeyKeeperApp/ui/pages/key_keepers/key_keepers_page.dart';
import 'package:KeyKeeperApp/ui/pages/local_auth/local_auth_page.dart';
import 'package:KeyKeeperApp/ui/pages/register/register_page.dart';
import 'package:KeyKeeperApp/ui/pages/root/root_page.dart';
import 'package:KeyKeeperApp/ui/pages/vault_lists/vault_lists_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: LocalAuthPage.route,
      page: () => LocalAuthPage(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: RegisterPage.route,
      page: () => RegisterPage(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: RootPage.route,
      page: () => RootPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: HomePage.route,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: VaultListsPage.route,
      page: () => VaultListsPage(),
      binding: VaultListsBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: KeyKeepersPage.route,
      page: () => KeyKeepersPage(),
      binding: KeyKeepersBinding(),
      transition: Transition.fadeIn,
    ),
    // GetPage(name: '/vaults', page: () => MyPage()),
    // GetPage(name: '/vault-details', page: () => MyPage()),
    // GetPage(name: '/key-keepers', page: () => MyPage()),
  ];
}
