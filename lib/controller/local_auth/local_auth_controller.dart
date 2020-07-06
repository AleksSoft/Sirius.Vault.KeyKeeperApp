import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:KeyKeeperApp/services/local_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

enum PinViewState { DEFAULT, CREATE_PIN, REPEAT_PIN }

class LocalAuthController extends GetxController {
  final _box = GetStorage();
  final _localAuthService = Get.find<LocalAuthService>();

  final TextEditingController pinPutController = TextEditingController();
  final FocusNode pinPutFocusNode = FocusNode();

  final _viewState = PinViewState.CREATE_PIN.obs;

  get viewState => this._viewState.value;

  String _prevPIN = '';

  String get header => _getHeaderStr();

  bool get showBack => (Get.arguments as bool) ?? false;

  @override
  void onInit() {
    super.onInit();
    _viewState.value = _box.hasData(AppStorageKeys.pinCode)
        ? PinViewState.DEFAULT
        : PinViewState.CREATE_PIN;
  }

  @override
  void onReady() {
    super.onReady();
    pinPutFocusNode.requestFocus();
    toggleLocalAuth();
  }

  void toggleLocalAuth() async {
    if (_box.hasData(AppStorageKeys.pinCode)) {
      bool authorized = await _localAuthService.authenticate();
      if (authorized) navigateBack(true);
    }
  }

  void submit(String pin) {
    switch (_viewState.value) {
      case PinViewState.CREATE_PIN:
        _prevPIN = pinPutController.text;
        pinPutController.clear();
        _viewState.value = PinViewState.REPEAT_PIN;
        break;
      case PinViewState.REPEAT_PIN:
        _saveNewPIN();
        break;
      case PinViewState.DEFAULT:
      default:
        _submitPIN();
        break;
    }
  }

  void _submitPIN() async {
    bool pinCorrect =
        _box.read(AppStorageKeys.pinCode) == pinPutController.text;
    if (pinCorrect) {
      navigateBack(true);
    } else {
      Get.defaultDialog(
        radius: 16.0,
        title: 'Wrong PIN',
        middleText: 'Try again',
        buttonColor: Colors.black,
        confirmTextColor: Colors.white,
        onConfirm: () {
          _viewState.value = PinViewState.DEFAULT;
          pinPutController.clear();
          Get.back();
        },
      );
    }
  }

  void _saveNewPIN() {
    if (_prevPIN == pinPutController.text) {
      _box.write(AppStorageKeys.pinCode, _prevPIN);
      _submitPIN();
    } else {
      Get.defaultDialog(
        radius: 16.0,
        title: 'PIN\'s not equal',
        middleText: 'Try again',
        buttonColor: Colors.black,
        confirmTextColor: Colors.white,
        onConfirm: () {
          _viewState.value = PinViewState.CREATE_PIN;
          pinPutController.clear();
          Get.back();
        },
      );
    }
  }

  String _getHeaderStr() {
    switch (_viewState.value) {
      case PinViewState.CREATE_PIN:
        return 'Create new PIN';
      case PinViewState.REPEAT_PIN:
        return 'Repeat new PIN';
      case PinViewState.DEFAULT:
      default:
        return 'Enter PIN';
    }
  }

  void navigateBack(bool result) => Get.back(result: result);
}
