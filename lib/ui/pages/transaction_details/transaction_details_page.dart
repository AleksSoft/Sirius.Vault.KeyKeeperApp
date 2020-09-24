import 'package:KeyKeeperApp/app/ui/app_sizes.dart';
import 'package:KeyKeeperApp/app/ui/app_ui_helpers.dart';
import 'package:KeyKeeperApp/controller/transaction_details/transaction_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionDetailsPage extends StatelessWidget {
  static final String route = '/transaction-details';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('vault name'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<TransactionDetailsController>(
            init: TransactionDetailsController(),
            builder: (_) => Padding(
              padding: const EdgeInsets.all(AppSizes.medium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Transaction details',
                    style: Get.textTheme.headline6,
                  ),
                  AppUiHelpers.vSpaceSmall,
                  _DetailsTile(
                    title: 'Operation ID',
                    value: 'operation id',
                    enableCopy: true,
                  ),
                  _DetailsTile(
                    title: 'Amount',
                    value: '0.00 USD',
                  ),
                  _DetailsTile(
                    title: 'Network Type',
                    value: 'mainnet',
                  ),
                  _DetailsTile(
                    title: 'Blockchain ID',
                    value: 'blockchainid',
                    enableCopy: true,
                  ),
                  AppUiHelpers.vSpaceMedium,
                  Text(
                    'Source',
                    style: Get.textTheme.headline6,
                  ),
                  AppUiHelpers.vSpaceSmall,
                  _DetailsTile(
                    title: 'Address',
                    value: 'address',
                    enableCopy: true,
                  ),
                  _DetailsTile(
                    title: 'Address Group',
                    value: 'addressgroup',
                  ),
                  _DetailsTile(
                    title: 'Name',
                    value: 'name',
                  ),
                  _DetailsTile(
                    title: 'Tag',
                    value: 'tag',
                  ),
                  _DetailsTile(
                    title: 'Tag Type',
                    value: 'tagtype',
                  ),
                  AppUiHelpers.vSpaceMedium,
                  Text(
                    'Destination',
                    style: Get.textTheme.headline6,
                  ),
                  AppUiHelpers.vSpaceSmall,
                  _DetailsTile(
                    title: 'Address',
                    value: 'address',
                    enableCopy: true,
                  ),
                  _DetailsTile(
                    title: 'Address Group',
                    value: 'addressgroup',
                  ),
                  _DetailsTile(
                    title: 'Name',
                    value: 'name',
                  ),
                  _DetailsTile(
                    title: 'Tag',
                    value: 'tag',
                  ),
                  AppUiHelpers.vSpaceMedium,
                  _DetailsTile(
                    title: 'Fee limit',
                    value: 'feelimit',
                  ),
                  _DetailsTile(
                    title: 'Account reference id',
                    value: 'referenceid',
                    enableCopy: true,
                  ),
                  _DetailsTile(
                    title: 'Api Key ID',
                    value: 'apikeyid',
                    enableCopy: true,
                  ),
                  _DetailsTile(
                    title: 'IP',
                    value: 'ip',
                    enableCopy: true,
                  ),
                  _DetailsTile(
                    title: 'Timestamp',
                    value: 'timestamp',
                  ),
                  _DetailsTile(
                    title: 'User ID',
                    value: 'userid',
                    enableCopy: true,
                  ),
                  _DetailsTile(
                    title: 'Withdraw reference ID',
                    value: 'referenceid',
                    enableCopy: true,
                  ),
                ],
              ),
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
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(this.title ?? ''),
      subtitle: Text(this.value ?? ''),
      trailing: Visibility(
        visible: this.enableCopy,
        child: IconButton(
          onPressed: () => TransactionDetailsController.con.copy(this.value),
          icon: Icon(Icons.content_copy),
        ),
      ),
    );
  }
}
