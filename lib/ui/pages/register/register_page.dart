import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:validator/app/utils/utils.dart';
import 'package:validator/controller/register/register_controller.dart';
import 'package:validator/ui/pages/home/pages/dev_settings/dev_settings_page.dart';
import 'package:validator/ui/widgets/empty_reloading_view.dart';
import 'package:validator/utils/gesture_utils.dart';

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
            IconButton(
              onPressed: () => RegisterController.con.scanQRCode(),
              icon: Icon(Icons.qr_code_scanner),
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
                    child: _BackupContentFileds(),
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

class _BackupContentFileds extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
          data: Get.theme.copyWith(
            primaryColor: AppColors.dark,
          ),
          child: TextFormField(
            controller: controller.passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: !controller.isPasswordVisible,
            onChanged: (v) => controller.update(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (v) => controller.isValidPass
                ? null
                : 'Password should be at least 8 chars long',
            maxLines: 1,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (s) => Get.focusScope.nextFocus(),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () => controller.togglePasswordVisibility(),
                icon: Icon(
                  controller.isPasswordVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              ),
              border: OutlineInputBorder(),
              labelText: 'Password',
              alignLabelWithHint: true,
            ),
          ),
        ),
        AppUiHelpers.vSpaceMedium,
        Theme(
          data: Get.theme.copyWith(
            primaryColor: AppColors.dark,
          ),
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            controller: controller.dataController,
            maxLines: 5,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (s) => GestureUtils.unfocus(),
            onChanged: (v) => controller.update(),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Encrypted data',
              alignLabelWithHint: true,
            ),
          ),
        ),
        AppUiHelpers.vSpaceExtraLarge,
        Center(
          child: ArgonButton(
            height: AppSizes.extraLarge * 1.5,
            width: Get.width - AppSizes.medium * 2,
            roundLoadingShape: true,
            borderRadius: 5.0,
            color:
                controller.isValidData ? AppColors.dark : AppColors.secondary,
            onTap: (a, b, s) =>
                controller.isValidData ? controller.submit() : {},
            splashColor:
                controller.isValidData ? AppColors.light : Colors.transparent,
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
        FlatButton(
          onPressed: () => RegisterController.con.skip(),
          child: Text('Skip'),
        ),
        Visibility(
          visible: controller.appConfig.isDev,
          child: FlatButton(
            onPressed: () => Get.to(DevSettingsPage()),
            child: Text(
              'Dev settings',
              style: TextStyle(fontSize: 10),
            ),
          ),
        ),
      ],
    );
  }
}
