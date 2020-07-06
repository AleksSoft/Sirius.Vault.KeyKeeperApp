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
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Visibility(
              visible: c.showBack,
              child: Positioned(
                top: 16.0,
                left: 16.0,
                child: IconButton(
                  onPressed: () => c.navigateBack(false),
                  icon: Icon(Icons.close, color: Colors.black),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 300.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Obx(() => Text(c.header, style: Get.textTheme.headline6)),
                    const SizedBox(height: 32.0),
                    _buildPinView(),
                    const SizedBox(height: 16.0),
                    _buildOr(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPinView() {
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

  Obx _buildOr() {
    return Obx(() => AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: c.viewState == PinViewState.DEFAULT ? 1.0 : 0.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
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
                onTap: () => c.toggleLocalAuth(),
                child: FaIcon(
                  FontAwesomeIcons.fingerprint,
                  size: 48.0,
                ),
              ),
            ],
          ),
        ));
  }
}
