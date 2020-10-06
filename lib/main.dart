import 'package:KeyKeeperApp/app/routes/app_routes.dart';
import 'package:KeyKeeperApp/app/ui/app_themes.dart';
import 'package:KeyKeeperApp/bindings/initial_binding.dart';
import 'package:KeyKeeperApp/ui/pages/root/root_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

void main() async {
  await GetStorage.init();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
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
        onInit: () async {
          _firebaseMessaging.configure(
            onMessage: (Map<String, dynamic> message) async {
              print("onMessage: $message");
            },
            onBackgroundMessage: backgroundMessageHandler,
            onLaunch: (Map<String, dynamic> message) async {
              print("onLaunch: $message");
            },
            onResume: (Map<String, dynamic> message) async {
              print("onResume: $message");
            },
          );
          await _firebaseMessaging.requestNotificationPermissions(
            const IosNotificationSettings(
              sound: true,
              badge: true,
              alert: true,
              provisional: true,
            ),
          );
          _firebaseMessaging.onIosSettingsRegistered.listen(
            (IosNotificationSettings settings) {
              print("Settings registered: $settings");
            },
          );
          _firebaseMessaging.getToken().then(
            (String token) {
              assert(token != null);
              print('token $token');
            },
          );
        },
      ),
    ),
  );
}

Future<dynamic> backgroundMessageHandler(Map<String, dynamic> message) async {
  print("onBackgroundMessage: $message");
}
