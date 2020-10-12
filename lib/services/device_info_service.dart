import 'package:validator/models/device_info_model.dart';
import 'package:device_info/device_info.dart';
import 'package:get/utils.dart';

class DeviceInfoService {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  static Future<String> get deviceInfo async {
    String id = await uid;
    String platform;
    if (GetPlatform.isAndroid) {
      platform = 'Android';
    } else if (GetPlatform.isIOS) {
      platform = 'iOS';
    }
    return DeviceInfoModel(deviceUID: id, platform: platform).toString();
  }

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
