enum Environment { dev, prod }

class AppConfig {
  Environment _environment = Environment.dev;

  bool get isDev => _environment == Environment.dev;
  bool get isProd => _environment == Environment.prod;

  Future<AppConfig> init({Environment environment}) async {
    this._environment = environment;
    return this;
  }
}
