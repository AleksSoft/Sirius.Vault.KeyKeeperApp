import 'package:KeyKeeperApp/app/ui/app_sizes.dart';
import 'package:KeyKeeperApp/app/ui/app_ui_helpers.dart';
import 'package:KeyKeeperApp/controller/register/register_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  static final String route = 'register';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: null,
      child: Scaffold(
        body: GetBuilder<RegisterController>(
          init: RegisterController(),
          builder: (_) {
            return Stack(
              children: [
                Positioned(
                  top: AppSizes.medium,
                  left: AppSizes.small,
                  right: AppSizes.small,
                  child: Text(
                    'Register',
                    textAlign: TextAlign.center,
                    style: Get.textTheme.headline6,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSizes.medium),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          initialValue: _.appKeyValue,
                          maxLines: null,
                          onChanged: (String value) => _.appKeyValue = value,
                          decoration: InputDecoration(
                            labelText: 'App key',
                          ),
                        ),
                        AppUiHelpers.vSpaceMedium,
                        Text(
                          'This screen is temporary.',
                          style: Get.textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: AppSizes.medium,
                  right: AppSizes.medium,
                  left: AppSizes.medium,
                  child: Obx(
                    () => CupertinoButton.filled(
                      onPressed: _.actionAllowed ? () => _.submit() : null,
                      child: Text('Submit app key'),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
