import 'package:KeyKeeperApp/bindings/key_keepers_binding.dart';
import 'package:KeyKeeperApp/ui/pages/home/home_page.dart';
import 'package:KeyKeeperApp/ui/pages/home/pages/requests/detail/transfer_detail_page.dart';
import 'package:KeyKeeperApp/ui/pages/home/pages/vaults/detail/vault_detail_page.dart';
import 'package:KeyKeeperApp/ui/pages/home/pages/vaults/invite/invite_page.dart';
import 'package:KeyKeeperApp/ui/pages/key_keepers/key_keepers_page.dart';
import 'package:KeyKeeperApp/ui/pages/local_auth/local_auth_page.dart';
import 'package:KeyKeeperApp/ui/pages/register/register_page.dart';
import 'package:KeyKeeperApp/ui/pages/root/root_page.dart';
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
    ),
    GetPage(
      name: HomePage.route,
      page: () => HomePage(),
    ),
    GetPage(
      name: KeyKeepersPage.route,
      page: () => KeyKeepersPage(),
      binding: KeyKeepersBinding(),
    ),
    GetPage(
      name: TransferDetailPage.route,
      page: () => TransferDetailPage(),
    ),
    GetPage(
      name: InvitePage.route,
      page: () => InvitePage(),
    ),
    GetPage(
      name: VaultDetailPage.route,
      page: () => VaultDetailPage(),
    ),
  ];
}
