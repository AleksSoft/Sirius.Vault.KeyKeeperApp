import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validator/app/common/common.dart';
import 'package:validator/controllers/controllers.dart';
import 'package:validator/ui/widgets/empty_reloading_view.dart';
import 'package:validator/ui/widgets/menu_page.dart';
import 'package:validator/ui/widgets/network_chip.dart';
import 'package:validator/ui/widgets/transaction_type_chip.dart';

class RequestsPage extends MenuPage {
  @override
  String get title => 'Requests';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestsController>(
      initState: (_) => RequestsController.con.reloadRequests(),
      builder: (_) => EmptyReloadingView(
        emptyMessage: 'msg_requests_empty'.tr,
        isEmpty: _.showEmptyCondition,
        isLoading: _.loading,
        onRefresh: () => _.silentReloadRequests(),
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
      child: Padding(
        padding: const EdgeInsets.only(top: AppSizes.small),
        child: ListTile(
          onTap: () => RequestsController.con.openDetails(args),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '${r.asset?.symbol ?? ''} ${r.amountStr}',
                style: Get.textTheme.subtitle2.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
              Text(
                r.transferContext?.requestContext?.timestampFormatted,
                style: Get.textTheme.caption,
              ),
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  r.blockchain?.id ?? '',
                  style: Get.textTheme.subtitle2,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              AppUiHelpers.hSpaceSmall,
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
      ),
    );
  }
}
