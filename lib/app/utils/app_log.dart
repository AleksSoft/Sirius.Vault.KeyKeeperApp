import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:logger_flutter/logger_flutter.dart';

class AppLog {
  static Logger get logger => Logger(
        printer: PrettyPrinter(),
      );

  static Logger get loggerNoStack => Logger(
        printer: PrettyPrinter(methodCount: 0),
      );

  static void showConsole() => Get.to(
        LogConsole(
          dark: Get.isPlatformDarkMode,
          showCloseButton: true,
        ),
      );
}
