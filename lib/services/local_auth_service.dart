import 'package:local_auth/local_auth.dart';
import 'package:validator/app/utils/utils.dart';

class LocalAuthService {
  static Future<bool> authenticate() async {
    final _auth = LocalAuthentication();
    try {
      if (await canCheckBiometrics) {
        await Future.delayed(Duration(milliseconds: 300));
        return await _auth.authenticateWithBiometrics(
          localizedReason: 'Authenticate to access',
          useErrorDialogs: true,
          stickyAuth: true,
        );
      } else {
        return false;
      }
    } catch (e) {
      AppLog.logger.e(e);
      return false;
    }
  }

  static Future<bool> get canCheckBiometrics async =>
      await LocalAuthentication().canCheckBiometrics;
}
