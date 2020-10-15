import 'package:validator/app/utils/utils.dart';
import 'package:validator/controller/controllers.dart';
import 'package:validator/ui/widgets/menu_page.dart';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BackupPage extends MenuPage {
  @override
  String get title => 'Backup';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<BackupController>(
        init: BackupController(),
        builder: (_) => Padding(
          padding: const EdgeInsets.all(AppSizes.medium),
          child: Stack(
            children: [
              Column(
                children: [
                  Text(
                    'Enter password please!\nIt will be used to encrypt your backup data.',
                    style: Get.textTheme.button.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  AppUiHelpers.vSpaceMedium,
                  Theme(
                    data: Get.theme.copyWith(primaryColor: AppColors.dark),
                    child: TextFormField(
                      controller: _.passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (v) => _.update(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: ArgonButton(
                    height: AppSizes.extraLarge * 1.5,
                    width: Get.width - AppSizes.medium * 2,
                    roundLoadingShape: true,
                    borderRadius: 5.0,
                    color: _.isValidPass ? AppColors.dark : AppColors.secondary,
                    onTap: (a, b, s) =>
                        _.isValidPass ? _.openBackupShare() : {},
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShareBackupPage extends StatelessWidget {
  ShareBackupPage({Key key}) : super(key: key);
  final c = BackupController.con;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: AppSizes.medium,
                right: AppSizes.medium,
                bottom: AppSizes.medium,
              ),
              child: Text(
                'Data is encrypted with your password.\nDon\'t forget it!',
                style: Get.textTheme.button.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Card(
                elevation: AppSizes.small,
                child: QrImage(
                  data: c.encryptedBackup,
                  size: 300,
                ),
              ),
            ),
            AppUiHelpers.vSpaceMedium,
            Text(
              'Scan QR code.\nOr just share encrypted data!',
              style: Get.textTheme.button.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            AppUiHelpers.vSpaceMedium,
            FloatingActionButton(
              heroTag: 'fab-backup-share',
              onPressed: () => c.share(),
              backgroundColor: AppColors.dark,
              child: Icon(Icons.share),
            ),
          ],
        ),
      ),
    );
  }
}
