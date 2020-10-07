import 'package:KeyKeeperApp/app/utils/utils.dart';
import 'package:KeyKeeperApp/controller/controllers.dart';
import 'package:KeyKeeperApp/ui/widgets/details_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VaultDetailPage extends StatelessWidget {
  static const String route = '/vault-detail';
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VaultDetailController>(
      init: VaultDetailController(),
      builder: (_) => WillPopScope(
        onWillPop: () => _.back(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Vault details'),
            actions: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _.edited
                    ? IconButton(
                        onPressed: () => _.save(),
                        icon: Icon(Icons.check),
                      )
                    : IconButton(
                        onPressed: () => _.detachVault(),
                        icon: Icon(Icons.delete_outline),
                      ),
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
                  AppUiHelpers.vSpaceMedium,
                  Theme(
                    data: Get.theme.copyWith(primaryColor: AppColors.dark),
                    child: TextField(
                      controller: _.localNameController,
                      keyboardType: TextInputType.name,
                      onChanged: (v) => _.update(),
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Local name',
                        alignLabelWithHint: true,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text('Status'),
                    trailing: Text(
                      _.stausOk ? 'Online' : 'Offline',
                      style: Get.textTheme.button.copyWith(
                        color: _.stausOk ? AppColors.green : AppColors.red,
                      ),
                    ),
                  ),
                  Divider(),
                  DetailsTile(
                    title: 'Name',
                    value: _.vault?.name ?? '',
                    enableCopy: false,
                  ),
                  DetailsTile(
                    title: 'Position',
                    value: _.vault?.position ?? '',
                    enableCopy: false,
                  ),
                  DetailsTile(
                    title: 'Description',
                    value: _.vault?.description ?? '',
                    enableCopy: false,
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
