import 'package:KeyKeeperApp/app/routes/app_routes.dart';
import 'package:KeyKeeperApp/app/ui/app_themes.dart';
import 'package:KeyKeeperApp/bindings/initial_binding.dart';
import 'package:KeyKeeperApp/ui/pages/root/root_page.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GestureDetector(
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        showPerformanceOverlay: false,
        showSemanticsDebugger: false,
        enableLog: true,
        locale: Locale('en'),
        title: 'Key Keeper',
        theme: AppThemes.light,
        getPages: AppRoutes.routes,
        transitionDuration: const Duration(milliseconds: 150),
        initialRoute: RootPage.route,
        initialBinding: InitialBinding(),
      ),
    ),
  );
}
