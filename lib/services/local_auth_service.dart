import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthService {
  final _auth = LocalAuthentication();

  Future<bool> authenticate() async {
    try {
      List<BiometricType> availableBiometrics =
          await _auth.getAvailableBiometrics();
      if (availableBiometrics.isNotEmpty) {
        await Future.delayed(Duration(milliseconds: 300));
        return await _auth.authenticateWithBiometrics(
          localizedReason: 'Authenticate to access',
          useErrorDialogs: true,
          stickyAuth: true,
        );
      } else {
        return false;
      }
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }
}
