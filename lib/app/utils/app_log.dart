import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:logger_flutter/logger_flutter.dart';

class AppLog {
  static Logger get logger => Logger(
        filter: _AppLogFilter(),
        printer: PrettyPrinter(
          methodCount: 2,
          errorMethodCount: 8,
          lineLength: 80,
          printTime: true,
        ),
      );

  static Logger get loggerNoStack => Logger(
        filter: _AppLogFilter(),
        printer: PrettyPrinter(
          methodCount: 0,
          lineLength: 80,
          printTime: true,
        ),
      );

  static void showConsole() => Get.to(
        LogConsole(
          dark: Get.isPlatformDarkMode,
          showCloseButton: true,
        ),
      );
}

class _AppLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
