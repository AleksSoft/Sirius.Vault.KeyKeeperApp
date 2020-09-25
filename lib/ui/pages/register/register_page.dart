import 'package:KeyKeeperApp/app/ui/app_colors.dart';
import 'package:KeyKeeperApp/app/ui/app_sizes.dart';
import 'package:KeyKeeperApp/app/ui/app_ui_helpers.dart';
import 'package:KeyKeeperApp/controller/register/register_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  static final String route = '/register';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: null,
      child: Scaffold(
        body: SafeArea(
          child: GetBuilder<RegisterController>(
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
                          Obx(
                            () => Theme(
                              data: Get.theme.copyWith(
                                primaryColor: AppColors.dark,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                initialValue: _.tokenValue,
                                maxLines: 5,
                                onChanged: (value) => _.tokenValue = value,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Token',
                                  alignLabelWithHint: true,
                                ),
                              ),
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
                    child: CupertinoButton.filled(
                      onPressed: () => _.submit(),
                      child: Text('Submit'),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
