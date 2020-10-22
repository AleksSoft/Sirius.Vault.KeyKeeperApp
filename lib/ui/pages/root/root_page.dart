import 'package:validator/app/utils/utils.dart';
import 'package:validator/controller/root/root_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validator/ui/pages/home/pages/dev_settings/dev_settings_page.dart';

class RootPage extends StatelessWidget {
  static final String route = '/';
  final _duration = const Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<RootController>(
        init: RootController(),
        builder: (_) => Stack(
          fit: StackFit.expand,
          children: <Widget>[
            AnimatedPositioned(
              duration: _duration,
              curve: Curves.easeInOutCubic,
              top: AppSizes.medium,
              right: AppSizes.medium,
              left: AppSizes.medium,
              bottom: _.showUi ? Get.height / 2 : AppSizes.medium,
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
                duration: _duration,
                curve: Curves.easeInOutCubic,
                opacity: _.showUi ? 1.0 : 0.0,
                child: AnimatedSwitcher(
                  duration: _duration,
                  child: _.versionOk
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            FlatButton(
                              onPressed: () => _.checkAuth(),
                              height: AppSizes.extraLarge * 2,
                              child: Text(
                                'start'.tr,
                                style: Get.textTheme.headline6,
                              ),
                            ),
                            Visibility(
                              visible: _.appConfig.isDev,
                              child: FlatButton(
                                onPressed: () => Get.to(DevSettingsPage()),
                                child: Text(
                                  'Dev settings',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Application is outaded',
                              textAlign: TextAlign.center,
                              style: Get.textTheme.headline6,
                            ),
                            AppUiHelpers.vSpaceExtraLarge,
                            Text(
                              'Please update te app to continue using',
                              textAlign: TextAlign.center,
                              style: Get.textTheme.caption,
                            ),
                            AppUiHelpers.vSpaceExtraLarge,
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
