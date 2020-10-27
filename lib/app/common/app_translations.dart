import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          "app_title": "Sirius Validator",
          "start": "Start",
          "msg_outdated": "Application is outaded",
          "msg_update": "Please update the app to continue",
          "msg_requests_empty": "No active requests available",
          "copyright": "© 2020 Swisschain, Inc."
        },
        'ru': {
          "app_title": "Sirius Validator",
          "start": "Начать",
          "msg_outdated": "Приложение устарело",
          "msg_update": "Пожалуйста, обновите приложение, чтобы продолжить",
          "msg_requests_empty": "Нету активных запросов",
          "copyright": "© 2020 Swisschain, Inc."
        },
      };
}
