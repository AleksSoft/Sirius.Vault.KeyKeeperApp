import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger_flutter/logger_flutter.dart';
import 'package:validator/services/api/api_service.dart';

import 'app/bindings/initial_binding.dart';
import 'app/common/common.dart';
import 'app/routes/app_routes.dart';
import 'app/utils/utils.dart';
import 'ui/pages/root/root_page.dart';

Future<void> mainCommon(Environment environment) async {
  WidgetsFlutterBinding.ensureInitialized();

  final bool notProd = environment != Environment.prod;

  // set only portrait orientation for device
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // init local storage
  await GetStorage.init();
  await GetStorage.init(AppConfigKeys.config);

  // init firebase
  await Firebase.initializeApp();

  // init async instances
  await Get.putAsync<RemoteConfig>(() => setupRemoteConfig(notProd));
  await Get.putAsync<AppConfig>(
    () => AppConfig().init(
      environment: environment,
      appApiVersion: AppApiVersion(1, 0),
    ),
  );
  await Get.putAsync<ApiService>(() => ApiService().init());

  if (notProd) {
    LogConsole.init();
  }

  // start app with all configurations done
  runApp(
    GestureDetector(
      onTap: () => GestureUtils.unfocus(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        showPerformanceOverlay: false,
        showSemanticsDebugger: false,
        enableLog: notProd,
        translations: AppTranslations(),
        locale: Locale('en'),
        title: _getAppTitle(environment),
        theme: AppThemes.light,
        getPages: AppRoutes.routes,
        transitionDuration: const Duration(milliseconds: 200),
        initialRoute: RootPage.route,
        initialBinding: InitialBinding(),
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
        ],
        onInit: () async {
          final FirebaseMessaging firebaseMessaging = FirebaseMessaging();
          if (Platform.isIOS) {
            await firebaseMessaging.requestNotificationPermissions(
              const IosNotificationSettings(),
            );
          }

          firebaseMessaging.configure(
            onMessage: (Map<String, dynamic> message) async {
              AppLog.loggerNoStack.v('FCM onMessage:\n$message');
            },
            onBackgroundMessage:
                GetPlatform.isIOS ? null : backgroundMessageHandler,
            onLaunch: (Map<String, dynamic> message) async {
              AppLog.loggerNoStack.v('FCM onLaunch:\n$message');
            },
            onResume: (Map<String, dynamic> message) async {
              AppLog.loggerNoStack.v('FCM onResume:\n$message');
            },
          );
          firebaseMessaging.onIosSettingsRegistered.listen(
            (IosNotificationSettings settings) {
              AppLog.loggerNoStack.v('FCM iOS settings registered:\n$settings');
            },
          );
          firebaseMessaging.getToken().then(
            (String token) {
              assert(token != null);
              GetStorage().write(AppStorageKeys.fcmToken, token).whenComplete(
                    () => AppLog.loggerNoStack.v('FCM token:\n$token'),
                  );
            },
          );
        },
      ),
    ),
  );
}

String _getAppTitle(Environment env) {
  switch (env) {
    case Environment.dev:
      return 'Dev Sirius Validator';
    case Environment.test:
      return 'Test Sirius Validator';
    case Environment.prod:
    default:
      return 'Sirius Validator';
  }
}

/// method to handle firebase push notification messages in background
Future<dynamic> backgroundMessageHandler(Map<String, dynamic> message) async {
  AppLog.loggerNoStack.v('FCM onBackgroundMessage:\n$message');
}

/// init firebase remote config
Future<RemoteConfig> setupRemoteConfig(bool notProd) async {
  final RemoteConfig remoteConfig = await RemoteConfig.instance;
  // Enable developer mode to relax fetch throttling
  remoteConfig.setConfigSettings(RemoteConfigSettings(debugMode: notProd));
  remoteConfig.setDefaults(<String, dynamic>{
    AppConfigKeys.apiUrls: ['sirius-validator.swisschain.io'],
  });
  try {
    await remoteConfig.fetch();
    await remoteConfig.activateFetched();
  } catch (e) {
    AppLog.logger.e(e);
  }
  return remoteConfig;
}
