import 'package:KeyKeeperApp/app/routes/app_routes.dart';
import 'package:KeyKeeperApp/app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      showPerformanceOverlay: false,
      showSemanticsDebugger: false,
      enableLog: true,
      locale: Locale('en'),
      title: 'Key Keeper',
      theme: AppThemes.light,
      darkTheme: AppThemes.light,
      themeMode: ThemeMode.system,
      getPages: AppRoutes.routes,
      initialRoute: '/',
    ),
  );
}
