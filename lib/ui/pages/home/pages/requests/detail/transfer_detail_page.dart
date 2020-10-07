import 'package:KeyKeeperApp/app/ui/app_colors.dart';
import 'package:KeyKeeperApp/app/ui/app_sizes.dart';
import 'package:KeyKeeperApp/app/ui/app_ui_helpers.dart';
import 'package:KeyKeeperApp/controller/controllers.dart';
import 'package:KeyKeeperApp/services/utils/formatter.dart';
import 'package:KeyKeeperApp/ui/widgets/details_tile.dart';
import 'package:KeyKeeperApp/ui/widgets/network_chip.dart';
import 'package:KeyKeeperApp/ui/widgets/transaction_type_chip.dart';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class TransferDetailPage extends StatelessWidget {
  static final String route = '/transfer-detail';
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransferDetailController>(
      init: TransferDetailController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Transfer'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: AppSizes.medium),
              child: TransactionTypeChip(_.transferDetail),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: AppSizes.medium,
              left: AppSizes.medium,
              right: AppSizes.medium,
              bottom: AppSizes.extraLarge,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Details:',
                  style: Get.textTheme.headline6.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppUiHelpers.vSpaceSmall,
                DetailsTile(
                  title: 'Operation ID',
                  value: _.transferDetail.operationId,
                  enableCopy: true,
                ),
                DetailsTile(
                  title: 'Amount',
                  value: Formatter.currency(
                    _.transferDetail?.amount,
                    suffix: _.transferDetail?.asset?.symbol,
                  ),
                ),
                DetailsTile(
                  title: 'Blockchain ID',
                  value: _.transferDetail.blockchainId,
                  enableCopy: true,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: Text('Network Type'),
                  trailing: NetworkChip(_.transferDetail),
                ),
                Divider(),
                AppUiHelpers.vSpaceMedium,
                Text(
                  'Source:',
                  style: Get.textTheme.headline6.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppUiHelpers.vSpaceSmall,
                DetailsTile(
                  title: 'Address',
                  value: _.transferDetail.source.address,
                  enableCopy: true,
                ),
                DetailsTile(
                  title: 'Address Group',
                  value: _.transferDetail.source.group,
                ),
                DetailsTile(
                  title: 'Name',
                  value: _.transferDetail.source.name,
                ),
                Divider(),
                AppUiHelpers.vSpaceMedium,
                Text(
                  'Destination:',
                  style: Get.textTheme.headline6.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppUiHelpers.vSpaceSmall,
                DetailsTile(
                  title: 'Address',
                  value: _.transferDetail.destination.address,
                  enableCopy: true,
                ),
                DetailsTile(
                  title: 'Address Group',
                  value: _.transferDetail.destination.group,
                ),
                DetailsTile(
                  title: 'Name',
                  value: _.transferDetail.destination.name,
                ),
                DetailsTile(
                  title: 'Tag',
                  value: _.transferDetail.destination.tag,
                ),
                Divider(),
                AppUiHelpers.vSpaceMedium,
                DetailsTile(
                  title: 'Fee limit',
                  value: _.transferDetail.feeLimit,
                ),
                DetailsTile(
                  title: 'Account reference id',
                  value: _.transferDetail.clientContext.accountReferenceId,
                  enableCopy: true,
                ),
                DetailsTile(
                  title: 'Api Key ID',
                  value: _.transferDetail.clientContext.apiKeyId,
                  enableCopy: true,
                ),
                DetailsTile(
                  title: 'IP',
                  value: _.transferDetail.clientContext.ip,
                  enableCopy: true,
                ),
                DetailsTile(
                  title: 'Timestamp',
                  value: _.transferDetail.clientContext.timestamp,
                ),
                DetailsTile(
                  title: 'User ID',
                  value: _.transferDetail.clientContext.userId,
                  enableCopy: true,
                ),
                DetailsTile(
                  title: 'Withdraw reference ID',
                  value: _.transferDetail.clientContext.withdrawalReferenceId,
                  enableCopy: true,
                ),
                Divider(),
                AppUiHelpers.vSpaceMedium,
                Text(
                  'Resolution:',
                  style: Get.textTheme.headline6.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppUiHelpers.vSpaceMedium,
                SizedBox(
                  width: Get.width - AppSizes.medium * 2,
                  child: CupertinoSegmentedControl<int>(
                    borderColor: AppColors.dark,
                    pressedColor: AppColors.dark,
                    selectedColor: AppColors.dark,
                    unselectedColor: AppColors.light,
                    padding: const EdgeInsets.all(0.0),
                    groupValue: _.selectedResolutionIndex,
                    onValueChanged: (index) => _.selectResolution(index),
                    children: {
                      0: Text(_.getResolutionName(0)),
                      1: Text(_.getResolutionName(1)),
                      2: Text(_.getResolutionName(2)),
                    },
                  ),
                ),
                AppUiHelpers.vSpaceMedium,
                Theme(
                  data: Get.theme.copyWith(
                    primaryColor: AppColors.dark,
                  ),
                  child: TextField(
                    controller: _.msgTextController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Message',
                      alignLabelWithHint: true,
                    ),
                  ),
                ),
                AppUiHelpers.vSpaceMedium,
                Center(
                  child: ArgonButton(
                    height: AppSizes.extraLarge * 1.5,
                    width: Get.width - AppSizes.medium * 2,
                    roundLoadingShape: true,
                    borderRadius: 5.0,
                    color: AppColors.dark,
                    onTap: (startLoading, stopLoading, btnState) {
                      if (btnState == ButtonState.Idle) {
                        startLoading();
                        _.checkSubmit().whenComplete(() => stopLoading());
                      }
                    },
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
