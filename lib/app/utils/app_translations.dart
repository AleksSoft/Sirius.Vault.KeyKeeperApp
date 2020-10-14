import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          "app_title": "Validator",
          "start": "Start",
          "copyright": "© 2020 Swisschain, Inc."
        },
        'ru': {
          "app_title": "Validator",
          "start": "Начать",
          "copyright": "© 2020 Swisschain, Inc."
        },
      };
}
