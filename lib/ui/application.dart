import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:validator/app/bindings/initial_binding.dart';
import 'package:validator/app/common/common.dart';
import 'package:validator/app/routes/app_routes.dart';
import 'package:validator/app/utils/utils.dart';
import 'package:validator/main_common.dart';

import 'pages/root/root_page.dart';

class Application extends StatelessWidget {
  const Application({
    @required this.isDev,
    @required this.firebaseMessaging,
    Key key,
  }) : super(key: key);

  final bool isDev;
  final FirebaseMessaging firebaseMessaging;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      showPerformanceOverlay: false,
      showSemanticsDebugger: false,
      enableLog: isDev,
      translations: AppTranslations(),
      locale: Locale('en'),
      title: 'Sirius Validator',
      theme: AppThemes.light,
      getPages: AppRoutes.routes,
      transitionDuration: const Duration(milliseconds: 200),
      initialRoute: RootPage.route,
      initialBinding: InitialBinding(),
      onInit: () {
        firebaseMessaging.configure(
          onMessage: (Map<String, dynamic> message) async {
            AppLog.loggerNoStack.i('onMessage: $message');
          },
          onBackgroundMessage:
              GetPlatform.isIOS ? null : backgroundMessageHandler,
          onLaunch: (Map<String, dynamic> message) async {
            AppLog.loggerNoStack.i('onLaunch: $message');
          },
          onResume: (Map<String, dynamic> message) async {
            AppLog.loggerNoStack.i('onResume: $message');
          },
        );
        firebaseMessaging.onIosSettingsRegistered.listen(
          (IosNotificationSettings settings) {
            AppLog.loggerNoStack.d('iOS settings registered: $settings');
          },
        );
        firebaseMessaging.getToken().then(
          (String token) {
            assert(token != null);
            GetStorage().write(AppStorageKeys.fcmToken, token).whenComplete(
                  () => AppLog.loggerNoStack.d('fcm token: $token'),
                );
          },
        );
      },
    );
  }
}
