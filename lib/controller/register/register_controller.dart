import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:KeyKeeperApp/services/api/api_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController {
  static RegisterController get con => Get.find();

  final _api = Get.find<ApiService>();
  final _storage = GetStorage();

  final _appKeyValue = ''.obs;
  String get tokenValue => this._appKeyValue.value;
  set tokenValue(String value) => this._appKeyValue.value = value;

  bool get actionAllowed => !tokenValue.isNullOrBlank;

  @override
  void onInit() {
    tokenValue = _storage.read(AppStorageKeys.token) ?? '';
    super.onInit();
  }

  void submit() => _storage
      .write(AppStorageKeys.token, tokenValue)
      .then((value) => _api.update().then((value) => Get.back()));
}
