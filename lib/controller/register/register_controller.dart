import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController get con => Get.find();

  final _appKeyValue = ''.obs;
  String get appKeyValue => this._appKeyValue.value;
  set appKeyValue(String value) => this._appKeyValue.value = value;

  bool get actionAllowed => !appKeyValue.isNullOrBlank;
}
