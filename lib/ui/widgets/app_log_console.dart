import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger_flutter/logger_flutter.dart';
import 'package:validator/app/common/app_config.dart';

class AppLogConsole extends StatelessWidget {
  AppLogConsole({@required this.child, Key key}) : super(key: key);

  final Widget child;
  final appConfig = Get.find<AppConfig>();

  @override
  Widget build(BuildContext context) {
    return this.appConfig.isProd
        ? this.child
        : LogConsoleOnShake(
            dark: Get.isDarkMode,
            debugOnly: false,
            child: this.child,
          );
  }
}
