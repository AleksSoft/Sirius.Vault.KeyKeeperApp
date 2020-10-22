import 'package:validator/app/utils/utils.dart';
import 'package:validator/controller/register/register_controller.dart';
import 'package:validator/ui/pages/home/pages/dev_settings/dev_settings_page.dart';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:validator/ui/widgets/empty_reloading_view.dart';

class RegisterPage extends StatelessWidget {
  static final String route = '/register';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: null,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Start from backup',
            textAlign: TextAlign.center,
            style: Get.textTheme.headline6,
          ),
          actions: [
            FlatButton(
              onPressed: () => RegisterController.con.skip(),
              child: Text('Skip'),
            ),
          ],
        ),
        body: GetBuilder<RegisterController>(
          init: RegisterController(),
          builder: (_) {
            return EmptyReloadingView(
              isLoading: _.loading,
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSizes.medium),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Enter password to decypt backup data',
                          style: Get.textTheme.button.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        AppUiHelpers.vSpaceMedium,
                        Theme(
                          data:
                              Get.theme.copyWith(primaryColor: AppColors.dark),
                          child: TextFormField(
                            controller: _.passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (v) => _.update(),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (v) => _.isValidPass
                                ? null
                                : 'Password should be at least 8 chars long',
                            maxLines: 1,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              alignLabelWithHint: true,
                            ),
                          ),
                        ),
                        AppUiHelpers.vSpaceMedium,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Enter encrypted backup text or scan QR code',
                              style: Get.textTheme.button.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            IconButton(
                              onPressed: () => _.scanQRCode(),
                              icon: Icon(Icons.qr_code_scanner),
                            ),
                          ],
                        ),
                        AppUiHelpers.vSpaceMedium,
                        Theme(
                          data: Get.theme.copyWith(
                            primaryColor: AppColors.dark,
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            controller: _.dataController,
                            maxLines: 5,
                            onChanged: (v) => _.update(),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Encrypted data',
                              alignLabelWithHint: true,
                            ),
                          ),
                        ),
                        AppUiHelpers.vSpaceMedium,
                        AppUiHelpers.vSpaceExtraLarge,
                        Center(
                          child: ArgonButton(
                            height: AppSizes.extraLarge * 1.5,
                            width: Get.width - AppSizes.medium * 2,
                            roundLoadingShape: true,
                            borderRadius: 5.0,
                            color: _.isValidData
                                ? AppColors.dark
                                : AppColors.secondary,
                            onTap: (a, b, s) => _.isValidData ? _.submit() : {},
                            splashColor: _.isValidData
                                ? AppColors.light
                                : Colors.transparent,
                            child: Text(
                              "Submit",
                              style: Get.textTheme.button.copyWith(
                                color: AppColors.light,
                              ),
                            ),
                            loader: Container(
                              padding: EdgeInsets.all(AppSizes.small),
                              child: SpinKitRotatingCircle(
                                color: Colors.white,
                                size: AppSizes.extraLarge,
                              ),
                            ),
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
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
