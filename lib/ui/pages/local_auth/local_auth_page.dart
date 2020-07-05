import 'package:KeyKeeperApp/controller/local_auth/local_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pinput/pin_put/pin_put.dart';

class LocalAuthPage extends StatelessWidget {
  static const String route = '/local-auth';

  final LocalAuthController c = Get.find<LocalAuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              onlySelectedBorderPinPut(),
              const SizedBox(height: 16.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      endIndent: 16.0,
                    ),
                  ),
                  Text('Or'),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      indent: 16.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {},
                child: FaIcon(
                  FontAwesomeIcons.fingerprint,
                  size: 48.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget onlySelectedBorderPinPut() {
    BoxDecoration pinPutDecoration = BoxDecoration(
      color: Colors.grey.withOpacity(0.4),
      borderRadius: BorderRadius.circular(5),
    );
    return PinPut(
      fieldsCount: 4,
      textStyle: Get.textTheme.headline5,
      eachFieldWidth: 48,
      eachFieldHeight: 56,
      onSubmit: (pin) => c.submit(pin),
      focusNode: c.pinPutFocusNode,
      controller: c.pinPutController,
      submittedFieldDecoration: pinPutDecoration,
      selectedFieldDecoration: pinPutDecoration.copyWith(
        color: Colors.white,
        border: Border.all(width: 2, color: Colors.black),
      ),
      followingFieldDecoration: pinPutDecoration,
      pinAnimationType: PinAnimationType.scale,
    );
  }
}
