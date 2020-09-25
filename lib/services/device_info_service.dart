import 'package:device_info/device_info.dart';
import 'package:get/utils.dart';

class DeviceInfoService {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  static Future<String> get uid async {
    if (GetPlatform.isAndroid) {
      return (await deviceInfoPlugin.androidInfo).androidId;
    } else if (GetPlatform.isIOS) {
      return (await deviceInfoPlugin.iosInfo).identifierForVendor;
    } else {
      return null;
    }
  }
}
