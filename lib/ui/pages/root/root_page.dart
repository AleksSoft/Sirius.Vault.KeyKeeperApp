import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger_flutter/logger_flutter.dart';
import 'package:validator/app/common/common.dart';
import 'package:validator/controllers/root/root_controller.dart';
import 'package:validator/ui/widgets/empty_reloading_view.dart';

class RootPage extends StatelessWidget {
  static final String route = '/';
  final _duration = const Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return LogConsoleOnShake(
      dark: Get.isDarkMode,
      child: Scaffold(
        body: GetX<RootController>(
          init: RootController(),
          builder: (_) => EmptyReloadingView(
            isLoading: _.loading,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                AnimatedPositioned(
                  duration: _duration,
                  onEnd: () => _.checkAuth(),
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
                        height: AppSizes.logoSize,
                        width: AppSizes.logoSize,
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
                  child: AnimatedSwitcher(
                    duration: _duration,
                    child: _BottomControls(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomControls extends StatelessWidget {
  final c = RootController.con;
  @override
  Widget build(BuildContext context) {
    switch (c.versionStatus) {
      case RootPageState.api_ok:
      case RootPageState.api_undefined:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FlatButton(
              onPressed: () => c.checkAuth(),
              height: AppSizes.extraLarge * 2,
              child: Text(
                'start'.tr,
                style: Get.textTheme.headline6,
              ),
            ),
            _DevSettingsButton(),
          ],
        );
      case RootPageState.api_outdated:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'msg_outdated'.tr,
              textAlign: TextAlign.center,
              style: Get.textTheme.headline6,
            ),
            AppUiHelpers.vSpaceExtraLarge,
            Text(
              'msg_update'.tr,
              textAlign: TextAlign.center,
              style: Get.textTheme.caption,
            ),
            AppUiHelpers.vSpaceExtraLarge,
            _DevSettingsButton(),
          ],
        );
      case RootPageState.starting:
      default:
        return SizedBox.shrink();
    }
  }
}

class _DevSettingsButton extends StatelessWidget {
  final c = RootController.con;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !c.appConfig.isProd,
      child: FlatButton(
        onPressed: () => c.openDevSettings(),
        child: Text(
          'Dev settings',
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
