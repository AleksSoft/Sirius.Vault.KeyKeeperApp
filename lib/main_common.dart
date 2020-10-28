import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';
import 'package:validator/services/api/api_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import 'app/bindings/initial_binding.dart';
import 'app/common/common.dart';
import 'app/routes/app_routes.dart';
import 'app/utils/utils.dart';
import 'ui/pages/root/root_page.dart';

Future<void> mainCommon(Environment environment) async {
  WidgetsFlutterBinding.ensureInitialized();

  final bool isDev = environment == Environment.dev;

  // set only portrait orientation for device
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // init local storage
  await GetStorage.init();
  await GetStorage.init(AppConfigKeys.config);

  // init firebase
  await Firebase.initializeApp();
  // init firebase messaging
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  // ask for needed permissions (push notifications)
  await _firebaseMessaging.requestNotificationPermissions(
    const IosNotificationSettings(
      sound: true,
      badge: true,
      alert: true,
      provisional: true,
    ),
  );

  // init async instances
  await Get.putAsync<RemoteConfig>(() => setupRemoteConfig(isDev));
  await Get.putAsync<AppConfig>(
    () => AppConfig().init(
      environment: environment,
      appApiVersion: AppApiVersion(1, 0),
    ),
  );
  await Get.putAsync<ApiService>(() => ApiService().init());

  // start app with all configurations done
  runApp(
    GestureDetector(
      onTap: () => GestureUtils.unfocus(),
      child: GetMaterialApp(
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
          _firebaseMessaging.configure(
            onMessage: (Map<String, dynamic> message) async {
              AppLog.loggerNoStack.i('FCM onMessage:\n$message');
            },
            onBackgroundMessage:
                GetPlatform.isIOS ? null : backgroundMessageHandler,
            onLaunch: (Map<String, dynamic> message) async {
              AppLog.loggerNoStack.i('FCM onLaunch:\n$message');
            },
            onResume: (Map<String, dynamic> message) async {
              AppLog.loggerNoStack.i('FCM onResume:\n$message');
            },
          );
          _firebaseMessaging.onIosSettingsRegistered.listen(
            (IosNotificationSettings settings) {
              AppLog.loggerNoStack.d('FCM iOS settings registered:\n$settings');
            },
          );
          _firebaseMessaging.getToken().then(
            (String token) {
              assert(token != null);
              GetStorage().write(AppStorageKeys.fcmToken, token).whenComplete(
                    () => AppLog.loggerNoStack.d('FCM token:\n$token'),
                  );
            },
          );
        },
      ),
    ),
  );
}

/// method to handle firebase push notification messages in background
Future<dynamic> backgroundMessageHandler(Map<String, dynamic> message) async {
  AppLog.loggerNoStack.i('FCM onBackgroundMessage:\n$message');
}

/// init firebase remote config
Future<RemoteConfig> setupRemoteConfig(bool isDebug) async {
  final RemoteConfig remoteConfig = await RemoteConfig.instance;
  // Enable developer mode to relax fetch throttling
  remoteConfig.setConfigSettings(RemoteConfigSettings(debugMode: isDebug));
  remoteConfig.setDefaults(<String, dynamic>{
    AppConfigKeys.prodUrl: 'sirius-validator.swisschain.io',
  });
  try {
    await remoteConfig.fetch();
    await remoteConfig.activateFetched();
  } catch (e) {
    AppLog.logger.e(e);
  }
  return remoteConfig;
}
