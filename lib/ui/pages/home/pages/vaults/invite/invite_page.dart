import 'package:KeyKeeperApp/app/utils/utils.dart';
import 'package:KeyKeeperApp/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvitePage extends StatelessWidget {
  static const String route = '/invite';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InviteController>(
      init: InviteController(),
      builder: (_) => Scaffold(
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(title: Text('New Invite')),
        floatingActionButton: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _.submitAllowed
              ? FloatingActionButton(
                  onPressed: () => InviteController.con.submitCode(),
                  child: Icon(Icons.add, color: AppColors.light),
                  backgroundColor: AppColors.dark,
                )
              : SizedBox.shrink(),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: AppSizes.medium,
            top: AppSizes.medium,
            right: AppSizes.medium,
            bottom: AppSizes.extraLarge,
          ),
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
      ),
    );
  }
}
