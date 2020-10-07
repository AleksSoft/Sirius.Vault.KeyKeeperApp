import 'package:KeyKeeperApp/app/utils/utils.dart';
import 'package:KeyKeeperApp/controller/controllers.dart';
import 'package:KeyKeeperApp/services/utils/formatter.dart';
import 'package:KeyKeeperApp/ui/widgets/menu_page.dart';
import 'package:KeyKeeperApp/ui/widgets/network_chip.dart';
import 'package:KeyKeeperApp/ui/widgets/transaction_type_chip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestsPage extends MenuPage {
  @override
  String get title => 'Requests';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestsController>(
      initState: (_) => RequestsController.con.reloadRequests(),
      builder: (_) => RefreshIndicator(
        color: AppColors.dark,
        onRefresh: () => _.reloadRequests(),
        child: ListView.builder(
          padding: const EdgeInsets.all(AppSizes.medium),
          itemCount: _.requests.length,
          itemBuilder: (context, index) => _RequestCard(_.requests[index]),
        ),
      ),
    );
  }
}

class _RequestCard extends StatelessWidget {
  const _RequestCard(this.args, {Key key}) : super(key: key);

  final TransferDetailArgs args;

  @override
  Widget build(BuildContext context) {
    var r = args.transferDetail;
    return Card(
      elevation: AppSizes.extraSmall,
      shadowColor: AppColors.dark.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizes.small),
        ),
      ),
      child: ListTile(
        onTap: () => RequestsController.con.openDetails(args),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              Formatter.currency(r.amount, suffix: r.asset?.symbol),
              style: Get.textTheme.subtitle2.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
            Text(
              r.clientContext?.timestamp ?? '',
              style: Get.textTheme.caption,
            ),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              r.blockchainId ?? '',
              style: Get.textTheme.subtitle2,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                NetworkChip(r),
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
