import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger_flutter/logger_flutter.dart';
import 'package:validator/app/common/app_config.dart';

class AppLogConsole extends StatelessWidget {
  AppLogConsole({@required this.child, Key key}) : super(key: key);

  final Widget child;
  final isDev = Get.find<AppConfig>().isDev;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this.isDev
          ? LogConsoleOnShake(
              child: this.child,
            )
          : this.child,
    );
  }
}
