import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';
import 'package:validator/app/common/app_storage_keys.dart';
import 'package:validator/app/routes/app_routes.dart';
import 'package:validator/bindings/initial_binding.dart';
import 'package:validator/services/api/api_service.dart';
import 'package:validator/ui/pages/root/root_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:validator/utils/gesture_utils.dart';

import 'app/common/app_config_keys.dart';
import 'app/utils/app_config.dart';
import 'app/utils/utils.dart';

Future<void> mainCommon(Environment environment) async {
  WidgetsFlutterBinding.ensureInitialized();

  final bool isDev = environment == Environment.dev;

  // set only portrait orientation for device
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // init local storage
  await GetStorage.init();
  await GetStorage.init(AppConfigKeys.config);

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
              print("---- onMessage: $message");
            },
            onBackgroundMessage:
                GetPlatform.isIOS ? null : backgroundMessageHandler,
            onLaunch: (Map<String, dynamic> message) async {
              print("---- onLaunch: $message");
            },
            onResume: (Map<String, dynamic> message) async {
              print("---- onResume: $message");
            },
          );
          _firebaseMessaging.onIosSettingsRegistered.listen(
            (IosNotificationSettings settings) {
              print("---- iOS settings registered: $settings");
            },
          );
          _firebaseMessaging.getToken().then(
            (String token) {
              assert(token != null);
              GetStorage()
                  .write(AppStorageKeys.fcmToken, token)
                  .whenComplete(() => print('---- fcm token: $token'));
            },
          );
        },
      ),
    ),
  );
}

/// method to handle firebase push notification messages in background
Future<dynamic> backgroundMessageHandler(Map<String, dynamic> message) async {
  print("---- onBackgroundMessage: $message");
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
    print(e);
  }
  return remoteConfig;
}
