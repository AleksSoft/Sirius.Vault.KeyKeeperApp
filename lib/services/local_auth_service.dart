import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthService {
  final _auth = LocalAuthentication();

  Future<bool> authenticate() async {
    try {
      await Future.delayed(Duration(milliseconds: 300));
      return await _auth.authenticateWithBiometrics(
        localizedReason: 'Authenticate to access',
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }
}
