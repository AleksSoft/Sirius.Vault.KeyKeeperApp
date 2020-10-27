import 'package:flutter/foundation.dart';

enum Environment { dev, prod }

class AppConfig {
  Environment _environment = Environment.dev;
  AppApiVersion _appApiVersion = AppApiVersion(0, 0);

  bool get isDev => _environment == Environment.dev;
  bool get isProd => _environment == Environment.prod;

  AppApiVersion get version => _appApiVersion;

  Future<AppConfig> init({
    @required Environment environment,
    @required AppApiVersion appApiVersion,
  }) async {
    this._environment = environment;
    this._appApiVersion = appApiVersion;
    return this;
  }
}

@immutable
class AppApiVersion {
  final int major;
  final int minor;
  AppApiVersion(this.major, this.minor);
}
