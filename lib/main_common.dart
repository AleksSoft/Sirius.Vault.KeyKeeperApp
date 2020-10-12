import 'package:validator/app/common/app_storage_keys.dart';
import 'package:validator/app/routes/app_routes.dart';
import 'package:validator/bindings/initial_binding.dart';
import 'package:validator/services/api/api_service.dart';
import 'package:validator/ui/pages/root/root_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import 'app/utils/app_config.dart';
import 'app/utils/utils.dart';

Future<void> mainCommon(Environment environment) async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  await _firebaseMessaging.requestNotificationPermissions(
    const IosNotificationSettings(
      sound: true,
      badge: true,
      alert: true,
      provisional: true,
    ),
  );

  await Get.putAsync<AppConfig>(
    () => AppConfig().init(environment: environment),
  );
  await Get.putAsync<ApiService>(() => ApiService().init());

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
        onInit: () {
          _firebaseMessaging.configure(
            onMessage: (Map<String, dynamic> message) async {
              print("onMessage: $message");
            },
            onBackgroundMessage:
                GetPlatform.isIOS ? null : backgroundMessageHandler,
            onLaunch: (Map<String, dynamic> message) async {
              print("onLaunch: $message");
            },
            onResume: (Map<String, dynamic> message) async {
              print("onResume: $message");
            },
          );
          _firebaseMessaging.onIosSettingsRegistered.listen(
            (IosNotificationSettings settings) {
              print("Settings registered: $settings");
            },
          );
          _firebaseMessaging.getToken().then(
            (String token) {
              assert(token != null);
              GetStorage()
                  .write(AppStorageKeys.fcmToken, token)
                  .whenComplete(() => print('token $token'));
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
