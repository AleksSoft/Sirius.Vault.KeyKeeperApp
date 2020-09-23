import 'package:KeyKeeperApp/app/common/app_storage_keys.dart';
import 'package:KeyKeeperApp/app/ui/app_colors.dart';
import 'package:KeyKeeperApp/services/local_auth_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

enum PinViewState { DEFAULT, CREATE_PIN, REPEAT_PIN }

class LocalAuthController extends GetxController {
  static LocalAuthController get con => Get.find();

  final _storage = GetStorage();

  final _viewState = PinViewState.CREATE_PIN.obs;
  get viewState => this._viewState.value;

  final _loading = false.obs;
  bool get loading => this._loading.value;
  set loading(bool value) => this._loading.value = value;

  final _pinValue = ''.obs;
  String get pinValue => this._pinValue.value;
  set pinValue(String value) => this._pinValue.value = value;

  String _prevPIN = '';

  String get header => _getHeaderStr();

  bool _isRegister;
  bool get showBack => !_isRegister ?? false;

  bool _showLocalAuth;
  bool get showLocalAuth => _showLocalAuth ?? false;

  int get fieldsCount => 4;

  @override
  void onInit() async {
    _isRegister = !_storage.hasData(AppStorageKeys.pinCode);
    _showLocalAuth =
        !_isRegister && (await LocalAuthService.canCheckBiometrics);
    _viewState.value =
        _isRegister ? PinViewState.CREATE_PIN : PinViewState.DEFAULT;
    ever(_pinValue, (pin) {
      if (pin?.length == fieldsCount) {
        submit(pin);
      }
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (showLocalAuth) {
      toggleLocalAuth();
    }
  }

  void toggleLocalAuth() async {
    if (!_isRegister) {
      bool authorized = await LocalAuthService.authenticate();
      if (authorized) {
        pinValue = _storage.read(AppStorageKeys.pinCode);
        await _submitPIN();
      }
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
    loading = true;
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
    loading = false;
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
