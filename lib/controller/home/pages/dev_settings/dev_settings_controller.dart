import 'package:KeyKeeperApp/services/api/api_service.dart';
import 'package:get/get.dart';

class DevSettingsController extends GetxController {
  static DevSettingsController get con => Get.find();

  final _api = Get.find<ApiService>();

  List<String> get urlList => ApiService.urls;

  String get defaultUrl => _api.defaultUrl;

  Future<void> updateDefaultUrl(String url) async {
    await _api.update(url: url);
    update();
  }
}
