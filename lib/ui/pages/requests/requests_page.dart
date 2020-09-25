import 'package:KeyKeeperApp/app/ui/app_colors.dart';
import 'package:KeyKeeperApp/app/ui/app_sizes.dart';
import 'package:KeyKeeperApp/controller/requests/requests_controller.dart';
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
          separatorBuilder: (context, index) => Divider(color: AppColors.dark),
          itemBuilder: (context, index) {
            var r = _.requests[index];
            return ListTile(
              title: Text(
                'Encrypted details:\n${r.transactionDetailsEncBase64}',
              ),
            );
          },
        ),
      ),
    );
  }
}
