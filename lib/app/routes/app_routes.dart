import 'package:KeyKeeperApp/bindings/home_binding.dart';
import 'package:KeyKeeperApp/bindings/root_binding.dart';
import 'package:KeyKeeperApp/ui/pages/home/home_page.dart';
import 'package:KeyKeeperApp/ui/pages/root/root_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RootPage.route,
      page: () => RootPage(),
      binding: RootBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: HomePage.route,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    // GetPage(name: '/vaults', page: () => MyPage()),
    // GetPage(name: '/vault-details', page: () => MyPage()),
    // GetPage(name: '/key-keepers', page: () => MyPage()),
  ];
}
