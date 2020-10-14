import 'package:validator/app/utils/utils.dart';
import 'package:validator/controller/root/root_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootPage extends StatelessWidget {
  static final String route = '/';
  final duration = const Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<RootController>(
        init: RootController(),
        builder: (_) => Stack(
          fit: StackFit.expand,
          children: <Widget>[
            AnimatedPositioned(
              onEnd: () => _.checkAuth(),
              duration: duration,
              top: _.showUi ? 120 : -10,
              right: 10,
              left: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo.png',
                    height: AppSizes.extraLarge * 2,
                    width: AppSizes.extraLarge * 2,
                  ),
                  AppUiHelpers.vSpaceLarge,
                  Text(
                    'app_title'.tr,
                    style: Get.textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: AppSizes.medium,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                duration: duration,
                opacity: _.showUi ? 1.0 : 0.0,
                child: FlatButton(
                  onPressed: () => _.checkAuth(),
                  child: Text('start'.tr),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
