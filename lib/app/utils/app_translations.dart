import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          "app_title": "Validator",
          "start": "Start",
          "msg_outdated": "Application is outaded",
          "msg_update": "Please update te app to continue",
          "copyright": "© 2020 Swisschain, Inc."
        },
        'ru': {
          "app_title": "Validator",
          "start": "Начать",
          "msg_outdated": "Приложение устарело",
          "msg_update": "Пожалуйста, обновите приложение, чтобы продолжить",
          "copyright": "© 2020 Swisschain, Inc."
        },
      };
}
