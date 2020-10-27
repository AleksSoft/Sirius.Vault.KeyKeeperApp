import 'package:validator/app/utils/utils.dart';
import 'package:validator/controller/controllers.dart';
import 'package:validator/ui/widgets/details_tile.dart';
import 'package:validator/ui/widgets/empty_reloading_view.dart';
import 'package:validator/ui/widgets/network_chip.dart';
import 'package:validator/ui/widgets/transaction_type_chip.dart';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:validator/utils/formatter.dart';
import 'package:validator/utils/gesture_utils.dart';

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
        floatingActionButton: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: !_.loading
              ? FloatingActionButton(
                  heroTag: 'fab-share-transferdetail',
                  onPressed: () => _.share(),
                  child: Icon(Icons.share),
                  backgroundColor: AppColors.dark,
                )
              : SizedBox.shrink(),
        ),
        body: EmptyReloadingView(
          isLoading: _.loading,
          child: _DetailsView(),
        ),
      ),
    );
  }
}

class _DetailsView extends StatelessWidget {
  final c = TransferDetailController.con;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              value: (c.transferDetail?.operationId ?? '').toString(),
              enableCopy: true,
            ),
            DetailsTile(
              title: 'Amount',
              value: Formatter.currency(
                (c.transferDetail?.amount ?? '').toString(),
                suffix: c.transferDetail?.asset?.symbol,
              ),
            ),
            DetailsTile(
              title: 'Blockchain ID',
              value: (c.transferDetail?.blockchain?.id ?? '').toString(),
              enableCopy: true,
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text('Network Type'),
              trailing: NetworkChip(c.transferDetail),
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
              value: c.transferDetail.sourceAddress?.address,
              enableCopy: true,
            ),
            DetailsTile(
              title: 'Address Group',
              value: c.transferDetail.sourceAddress?.group,
            ),
            DetailsTile(
              title: 'Name',
              value: c.transferDetail.sourceAddress?.name,
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
              value: c.transferDetail.destinationAddress?.address,
              enableCopy: true,
            ),
            DetailsTile(
              title: 'Address Group',
              value: c.transferDetail.destinationAddress?.group,
            ),
            DetailsTile(
              title: 'Name',
              value: c.transferDetail.destinationAddress?.name,
            ),
            DetailsTile(
              title: 'Tag',
              value: c.transferDetail.destinationAddress?.tag,
            ),
            Divider(),
            AppUiHelpers.vSpaceMedium,
            DetailsTile(
              title: 'Fee limit',
              value: (c.transferDetail.feeLimit ?? '').toString(),
            ),
            DetailsTile(
              title: 'Account reference id',
              value: c.transferDetail.transferContext?.accountReferenceId,
              enableCopy: true,
            ),
            DetailsTile(
              title: 'Api Key ID',
              value: c.transferDetail.transferContext?.requestContext?.apiKeyId,
              enableCopy: true,
            ),
            DetailsTile(
              title: 'IP',
              value: c.transferDetail.transferContext?.requestContext?.ip,
              enableCopy: true,
            ),
            DetailsTile(
              title: 'Timestamp',
              value: c.transferDetail.transferContext?.requestContext
                  ?.timestampFormatted,
            ),
            DetailsTile(
              title: 'User ID',
              value: c.transferDetail.transferContext?.requestContext?.userId,
              enableCopy: true,
            ),
            DetailsTile(
              title: 'Withdraw reference ID',
              value: c.transferDetail.transferContext?.withdrawalReferenceId,
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
                groupValue: c.selectedResolutionIndex,
                onValueChanged: (index) => c.selectResolution(index),
                children: {
                  0: Text(c.getResolutionName(0)),
                  1: Text(c.getResolutionName(1)),
                  2: Text(c.getResolutionName(2)),
                },
              ),
            ),
            AppUiHelpers.vSpaceMedium,
            Theme(
              data: Get.theme.copyWith(
                primaryColor: AppColors.dark,
              ),
              child: TextFormField(
                controller: c.msgTextController,
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
                    GestureUtils.unfocus();
                    startLoading();
                    c.checkSubmit().whenComplete(() => stopLoading());
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
    );
  }
}
