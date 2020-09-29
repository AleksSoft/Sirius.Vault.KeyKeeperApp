import 'package:KeyKeeperApp/app/ui/app_colors.dart';
import 'package:KeyKeeperApp/app/ui/app_sizes.dart';
import 'package:KeyKeeperApp/app/ui/app_ui_helpers.dart';
import 'package:KeyKeeperApp/controller/invite/invite_controller.dart';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class InvitePage extends StatelessWidget {
  static const String route = '/invite';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Invite')),
      body: GetBuilder<InviteController>(
        init: InviteController(),
        builder: (_) => Padding(
          padding: const EdgeInsets.only(
            left: AppSizes.medium,
            top: AppSizes.medium,
            right: AppSizes.medium,
            bottom: AppSizes.extraLarge,
          ),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Write down invitation code:'),
                        FlatButton(
                          onPressed: () => _.scanQRCode(),
                          child: Text(
                            'Scan QR',
                            style: Get.textTheme.button.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Theme(
                      data: Get.theme.copyWith(primaryColor: AppColors.dark),
                      child: TextField(
                        controller: _.inviteCodeController,
                        keyboardType: TextInputType.multiline,
                        onChanged: (v) => _.update(),
                        maxLines: 5,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Invite code (required)',
                          alignLabelWithHint: true,
                        ),
                      ),
                    ),
                    AppUiHelpers.vSpaceMedium,
                    Theme(
                      data: Get.theme.copyWith(primaryColor: AppColors.dark),
                      child: TextField(
                        controller: _.vaultNameController,
                        keyboardType: TextInputType.name,
                        onChanged: (v) => _.update(),
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Vault name (required)',
                          alignLabelWithHint: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _.submitAllowed
                      ? Center(
                          child: ArgonButton(
                            height: AppSizes.extraLarge * 1.5,
                            width: Get.width - AppSizes.medium * 2,
                            roundLoadingShape: true,
                            borderRadius: 5.0,
                            color: AppColors.dark,
                            onTap: (startLoading, stopLoading, btnState) {
                              if (btnState == ButtonState.Idle) {
                                startLoading();
                                _.submitCode().whenComplete(
                                      () => stopLoading(),
                                    );
                              }
                            },
                            child: Text(
                              'Submit code',
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
                        )
                      : SizedBox.shrink(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
