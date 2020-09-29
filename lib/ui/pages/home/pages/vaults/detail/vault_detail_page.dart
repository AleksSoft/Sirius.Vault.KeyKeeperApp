import 'package:KeyKeeperApp/app/ui/app_colors.dart';
import 'package:KeyKeeperApp/app/ui/app_sizes.dart';
import 'package:KeyKeeperApp/controller/vault_detail/vault_detail_controller.dart';
import 'package:KeyKeeperApp/ui/widgets/details_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VaultDetailPage extends StatelessWidget {
  static const String route = '/vault-detail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vault details')),
      body: SingleChildScrollView(
        child: GetBuilder<VaultDetailController>(
          init: VaultDetailController(),
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
                  'Details:',
                  style: Get.textTheme.headline6.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                  value: 'name',
                  enableCopy: false,
                ),
                DetailsTile(
                  title: 'Position',
                  value: 'position',
                  enableCopy: false,
                ),
                DetailsTile(
                  title: 'Description',
                  value: 'description',
                  enableCopy: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
