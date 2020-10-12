import 'package:validator/bindings/home_binding.dart';
import 'package:validator/ui/pages/home/home_page.dart';
import 'package:validator/ui/pages/home/pages/requests/detail/transfer_detail_page.dart';
import 'package:validator/ui/pages/home/pages/vaults/detail/vault_detail_page.dart';
import 'package:validator/ui/pages/home/pages/vaults/invite/invite_page.dart';
import 'package:validator/ui/pages/register/register_page.dart';
import 'package:validator/ui/pages/root/root_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
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
      binding: HomeBinding(),
      transition: Transition.fade,
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
