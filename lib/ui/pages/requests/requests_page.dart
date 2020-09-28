import 'package:KeyKeeperApp/app/ui/app_colors.dart';
import 'package:KeyKeeperApp/app/ui/app_sizes.dart';
import 'package:KeyKeeperApp/app/ui/app_ui_helpers.dart';
import 'package:KeyKeeperApp/controller/requests/requests_controller.dart';
import 'package:KeyKeeperApp/models/transfer_detail_model.dart';
import 'package:KeyKeeperApp/services/utils/formatter.dart';
import 'package:KeyKeeperApp/ui/pages/transaction_details/transaction_details_page.dart';
import 'package:KeyKeeperApp/ui/widgets/transaction_type_chip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestsController>(
      init: RequestsController(),
      builder: (_) => RefreshIndicator(
        color: AppColors.dark,
        onRefresh: () => _.loadRequests(),
        child: ListView.separated(
          padding: const EdgeInsets.all(AppSizes.medium),
          itemCount: _.requests.length,
          separatorBuilder: (context, index) => AppUiHelpers.vSpaceMedium,
          itemBuilder: (context, index) => _RequestCard(_.requests[index]),
        ),
      ),
    );
  }
}

class _RequestCard extends StatelessWidget {
  const _RequestCard(this.r, {Key key}) : super(key: key);

  final TransferDetailModel r;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSizes.extraSmall,
      shadowColor: AppColors.dark.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizes.small),
        ),
      ),
      child: ListTile(
        onTap: () => Get.toNamed(TransactionDetailsPage.route, arguments: r),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              Formatter.currency(r.amount, symbol: r.asset.symbol),
              style: Get.textTheme.subtitle2.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
            Text(
              r.clientContext.timestamp,
              style: Get.textTheme.caption,
            ),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              r.blockchainId,
              style: Get.textTheme.subtitle2,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                _NetworkChip(r),
                AppUiHelpers.hSpaceSmall,
                TransactionTypeChip(r),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _NetworkChip extends StatelessWidget {
  const _NetworkChip(this.r, {Key key}) : super(key: key);

  final TransferDetailModel r;

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.small,
      ),
      label: Text(
        r.networkType,
        style: Get.textTheme.button.copyWith(
          color: AppColors.primary,
        ),
      ),
      backgroundColor: r.networkInsecure ? AppColors.red : AppColors.green,
      elevation: 0,
    );
  }
}
