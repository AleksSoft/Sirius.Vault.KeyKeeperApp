import 'package:validator/app/common/app_storage_keys.dart';
import 'package:validator/app/common/common.dart';
import 'package:validator/services/local_auth_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

enum PinViewState { DEFAULT, CREATE_PIN, REPEAT_PIN }

class LocalAuthController extends GetxController {
  static LocalAuthController get con => Get.find();

  final _storage = GetStorage();

  final _viewState = PinViewState.CREATE_PIN.obs;
  get viewState => this._viewState.value;

  final _pinValue = ''.obs;
  String get pinValue => this._pinValue.value;
  set pinValue(String value) => this._pinValue.value = value;

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    if (loading != value) {
      _loading = value;
      update();
    }
  }

  String _prevPIN = '';

  String get header => _getHeaderStr();

  bool _showBack = false;
  bool get showBack => _showBack;

  bool _showLocalAuth = false;
  bool get showLocalAuth => _showLocalAuth;

  int get fieldsCount => 4;

  @override
  void onInit() async {
    ever(_pinValue, (pin) {
      if (pin?.length == fieldsCount) {
        submit(pin);
      }
    });
    super.onInit();
  }

  Future<void> initialize({
    bool isCreatePin = false,
    bool isCloseVisible = true,
    bool checkLocalAuth = true,
  }) async {
    pinValue = '';
    _prevPIN = '';
    loading = false;

    _showBack = isCloseVisible;
    _showLocalAuth = checkLocalAuth &&
        !isCreatePin &&
        (await LocalAuthService.canCheckBiometrics);
    _viewState.value =
        isCreatePin ? PinViewState.CREATE_PIN : PinViewState.DEFAULT;

    update();

    tryToggleLocalAuth();
  }

  Future<void> tryToggleLocalAuth() async {
    if (showLocalAuth) {
      loading = true;
      bool authorized = await LocalAuthService.authenticate();
      if (authorized) {
        pinValue = _storage.read(AppStorageKeys.pinCode);
        await _submitPIN();
      }
      loading = false;
    }
  }

  void setValue(String val) {
    if (pinValue.length < fieldsCount) {
      pinValue += val;
    }
  }

  void backspace() {
    if (pinValue.length > 0) {
      pinValue = pinValue.split('').sublist(0, pinValue.length - 1).join('');
    }
  }

  Future<void> submit(String pin) async {
    switch (_viewState.value) {
      case PinViewState.CREATE_PIN:
        _createPIN();
        break;
      case PinViewState.REPEAT_PIN:
        _saveNewPIN();
        break;
      case PinViewState.DEFAULT:
      default:
        await _submitPIN();
        break;
    }
  }

  void _createPIN() {
    _prevPIN = pinValue;
    pinValue = '';
    _viewState.value = PinViewState.REPEAT_PIN;
  }

  Future<void> _submitPIN() async {
    String pin = _storage.read(AppStorageKeys.pinCode);
    if (pin == pinValue) {
      _storage
          .write(AppStorageKeys.pinCode, pinValue)
          .then((value) => navigateBack(true));
    } else {
      Get.defaultDialog(
        title: 'Wrong PIN',
        middleText: 'Try again',
        buttonColor: AppColors.dark,
        confirmTextColor: AppColors.primary,
        onConfirm: () {
          _viewState.value = PinViewState.DEFAULT;
          pinValue = '';
          Get.back();
        },
      );
    }
    update();
  }

  Future<void> _saveNewPIN() async {
    if (_prevPIN == pinValue) {
      await _storage.write(AppStorageKeys.pinCode, pinValue);
      navigateBack(true);
    } else {
      Get.defaultDialog(
        title: 'PIN\'s are not equal',
        middleText: 'Try again',
        buttonColor: AppColors.dark,
        confirmTextColor: AppColors.primary,
        onConfirm: () {
          _viewState.value = PinViewState.CREATE_PIN;
          pinValue = '';
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
