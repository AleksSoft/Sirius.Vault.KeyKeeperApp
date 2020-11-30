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
import 'package:validator/repositories/invites_repository.dart';
import 'package:validator/repositories/vaults_repository.dart';
import 'package:validator/services/api/api_service.dart';

import 'app/bindings/initial_binding.dart';
import 'app/common/common.dart';
import 'app/routes/app_routes.dart';
import 'app/utils/utils.dart';
import 'ui/pages/root/root_page.dart';

Future<void> mainCommon(Environment environment) async {
  WidgetsFlutterBinding.ensureInitialized();

  // set only portrait orientation for device
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // init local storage
  await GetStorage.init();
  await GetStorage.init(AppConfigKeys.config);

  // init firebase
  await Firebase.initializeApp();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final FirebaseAnalytics _firebaseAnalytics = FirebaseAnalytics();

  // init async instances
  await Get.putAsync<RemoteConfig>(() => _setupRemoteConfig());
  await Get.putAsync<ApiService>(() => ApiService().init());
  await Get.putAsync<AppConfig>(
    () => AppConfig().init(
      environment: environment,
      appApiVersion: AppApiVersion(1, 0),
    ),
  );

  final AppConfig _appConfig = Get.find<AppConfig>();
  if (!_appConfig.isProd) LogConsole.init();

  // start app with all configurations done
  runApp(
    GestureDetector(
      onTap: () => GestureUtils.unfocus(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        showPerformanceOverlay: false,
        showSemanticsDebugger: false,
        enableLog: !_appConfig.isProd,
        translations: AppTranslations(),
        locale: Locale('en'),
        title: _appConfig.appTitle,
        theme: AppThemes.light,
        getPages: AppRoutes.routes,
        transitionDuration: const Duration(milliseconds: 300),
        initialRoute: RootPage.route,
        initialBinding: InitialBinding(),
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: _firebaseAnalytics),
        ],
        onInit: () {
          final _storage = GetStorage();
          String _appFcmToken = _storage.read(AppStorageKeys.fcmToken);

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

          _firebaseMessaging.requestNotificationPermissions(
            const IosNotificationSettings(
              sound: true,
              badge: true,
              alert: true,
              provisional: false,
            ),
          );

          _firebaseMessaging.getToken().then((String token) {
            if (_appFcmToken != token) {
              _appFcmToken = token;
              _saveFcmToken(_storage, _appFcmToken);
            }
          });

          _firebaseMessaging.onTokenRefresh.listen((String token) {
            if (_appFcmToken != token) {
              _appFcmToken = token;
              _saveFcmToken(_storage, _appFcmToken);
            }
          });
        },
      ),
    ),
  );
}

void _saveFcmToken(GetStorage storage, String token) {
  assert(token != null);
  storage.write(AppStorageKeys.fcmToken, token).whenComplete(() {
    VaultsRepository.savedApiKeys.forEach((apiKey) async =>
        await InvitesRepository().refreshPushNotificationFCMToken(
          pushNotificationFCMToken: token,
          apiKey: apiKey,
        ));
    AppLog.loggerNoStack.i('FCM token:\n$token');
  });
}

/// method to handle firebase push notification messages in background
Future<dynamic> backgroundMessageHandler(Map<String, dynamic> message) async {
  AppLog.loggerNoStack.i('FCM onBackgroundMessage:\n$message');
}

/// init firebase remote config
Future<RemoteConfig> _setupRemoteConfig() async {
  final RemoteConfig remoteConfig = await RemoteConfig.instance;
  // Enable developer mode to relax fetch throttling
  remoteConfig.setConfigSettings(RemoteConfigSettings(debugMode: false));
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
