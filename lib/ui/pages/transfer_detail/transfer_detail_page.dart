import 'package:KeyKeeperApp/app/ui/app_colors.dart';
import 'package:KeyKeeperApp/app/ui/app_sizes.dart';
import 'package:KeyKeeperApp/app/ui/app_ui_helpers.dart';
import 'package:KeyKeeperApp/controller/transfer_detail/transfer_detail_controller.dart';
import 'package:KeyKeeperApp/services/utils/formatter.dart';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class TransferDetailPage extends StatelessWidget {
  static final String route = '/transaction-details';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('vault name'),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<TransferDetailController>(
          init: TransferDetailController(),
          builder: (_) => Padding(
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
                  'Transaction details',
                  style: Get.textTheme.headline6.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppUiHelpers.vSpaceSmall,
                _DetailsTile(
                  title: 'Operation ID',
                  value: _.transferDetail.operationId,
                  enableCopy: true,
                ),
                _DetailsTile(
                  title: 'Amount',
                  value:
                      '${_.transferDetail.asset.symbol} ${Formatter.currency(_.transferDetail.amount)}',
                ),
                _DetailsTile(
                  title: 'Network Type',
                  value: _.transferDetail.networkType,
                ),
                _DetailsTile(
                  title: 'Blockchain ID',
                  value: _.transferDetail.blockchainId,
                  enableCopy: true,
                ),
                Divider(),
                AppUiHelpers.vSpaceMedium,
                Text(
                  'Source',
                  style: Get.textTheme.headline6.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppUiHelpers.vSpaceSmall,
                _DetailsTile(
                  title: 'Address',
                  value: _.transferDetail.source.address,
                  enableCopy: true,
                ),
                _DetailsTile(
                  title: 'Address Group',
                  value: _.transferDetail.source.addressGroup,
                ),
                _DetailsTile(
                  title: 'Name',
                  value: _.transferDetail.source.name,
                ),
                _DetailsTile(
                  title: 'Tag',
                  value: _.transferDetail.source.tag,
                ),
                _DetailsTile(
                  title: 'Tag Type',
                  value: _.transferDetail.source.tagType,
                ),
                Divider(),
                AppUiHelpers.vSpaceMedium,
                Text(
                  'Destination',
                  style: Get.textTheme.headline6.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppUiHelpers.vSpaceSmall,
                _DetailsTile(
                  title: 'Address',
                  value: _.transferDetail.destination.address,
                  enableCopy: true,
                ),
                _DetailsTile(
                  title: 'Address Group',
                  value: _.transferDetail.destination.addressGroup,
                ),
                _DetailsTile(
                  title: 'Name',
                  value: _.transferDetail.destination.name,
                ),
                _DetailsTile(
                  title: 'Tag',
                  value: _.transferDetail.destination.tag,
                ),
                Divider(),
                AppUiHelpers.vSpaceMedium,
                _DetailsTile(
                  title: 'Fee limit',
                  value: _.transferDetail.feeLimit,
                ),
                _DetailsTile(
                  title: 'Account reference id',
                  value: _.transferDetail.clientContext.accountReferenceId,
                  enableCopy: true,
                ),
                _DetailsTile(
                  title: 'Api Key ID',
                  value: _.transferDetail.clientContext.apiKeyId,
                  enableCopy: true,
                ),
                _DetailsTile(
                  title: 'IP',
                  value: _.transferDetail.clientContext.iP,
                  enableCopy: true,
                ),
                _DetailsTile(
                  title: 'Timestamp',
                  value: _.transferDetail.clientContext.timestamp,
                ),
                _DetailsTile(
                  title: 'User ID',
                  value: _.transferDetail.clientContext.userId,
                  enableCopy: true,
                ),
                _DetailsTile(
                  title: 'Withdraw reference ID',
                  value: _.transferDetail.clientContext.withdrawalReferenceId,
                  enableCopy: true,
                ),
                Divider(),
                AppUiHelpers.vSpaceMedium,
                Text(
                  'Resolution',
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

class _DetailsTile extends StatelessWidget {
  const _DetailsTile({
    @required this.title,
    @required this.value,
    this.enableCopy = false,
    Key key,
  }) : super(key: key);
  final String title;
  final String value;
  final bool enableCopy;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: this.value != null,
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        title: Text(this.title ?? ''),
        subtitle: Text(this.value ?? ''),
        trailing: Visibility(
          visible: this.enableCopy,
          child: IconButton(
            onPressed: () => TransferDetailController.con.copy(
              this.title,
              this.value,
            ),
            icon: Icon(Icons.content_copy),
          ),
        ),
      ),
    );
  }
}
