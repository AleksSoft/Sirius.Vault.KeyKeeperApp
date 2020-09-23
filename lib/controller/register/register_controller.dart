import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController {
  static RegisterController get con => Get.find();

  final _storage = GetStorage();

  final _appKeyValue = ''.obs;
  String get tokenValue => this._appKeyValue.value;
  set tokenValue(String value) => this._appKeyValue.value = value;

  bool get actionAllowed => !tokenValue.isNullOrBlank;

  void submit() => _storage
      .writeIfNull(AppStorageKeys.token, tokenValue)
      .then((value) => Get.back());
}
