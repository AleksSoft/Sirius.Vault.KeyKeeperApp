import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:validator/app/utils/utils.dart';
import 'package:validator/controller/controllers.dart';

class ShareBackupPage extends StatelessWidget {
  ShareBackupPage({Key key}) : super(key: key);
  final c = BackupController.con;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: Center(
        child: SingleChildScrollView(
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
              AppUiHelpers.vSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }
}
