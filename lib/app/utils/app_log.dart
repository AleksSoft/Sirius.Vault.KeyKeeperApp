import 'package:logger/logger.dart';

class AppLog {
  static Logger get logger => Logger(
        printer: PrettyPrinter(),
      );

  static Logger get loggerNoStack => Logger(
        printer: PrettyPrinter(methodCount: 0),
      );
}
