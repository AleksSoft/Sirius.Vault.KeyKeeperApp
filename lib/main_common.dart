import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';
import 'package:logger_flutter/logger_flutter.dart';
import 'package:validator/services/api/api_service.dart';
import 'package:validator/ui/application.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import 'app/common/common.dart';
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
      child: Application(
        isDev: isDev,
        firebaseMessaging: _firebaseMessaging,
      ),
    ),
  );
}

/// method to handle firebase push notification messages in background
Future<dynamic> backgroundMessageHandler(Map<String, dynamic> message) async {
  AppLog.loggerNoStack.i('onBackgroundMessage: $message');
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
