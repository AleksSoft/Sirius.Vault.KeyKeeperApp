import 'package:KeyKeeperApp/app/ui/app_colors.dart';
import 'package:KeyKeeperApp/app/ui/app_sizes.dart';
import 'package:KeyKeeperApp/app/ui/app_ui_helpers.dart';
import 'package:KeyKeeperApp/controller/vaults/vaults_controller.dart';
import 'package:KeyKeeperApp/ui/widgets/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VaultsPage extends MenuPage {
  @override
  String get title => 'Vaults';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VaultsController>(
      init: VaultsController(),
      builder: (_) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => _.openNewInvite(),
          child: Icon(Icons.add),
          backgroundColor: AppColors.dark,
        ),
        body: RefreshIndicator(
          color: AppColors.dark,
          onRefresh: () => _.loadVaults(),
          child: ListView.separated(
            padding: const EdgeInsets.all(AppSizes.medium),
            itemCount: _.vaults.length,
            separatorBuilder: (context, index) => AppUiHelpers.vSpaceMedium,
            itemBuilder: (context, index) => _VaultCard(),
          ),
        ),
      ),
    );
  }
}

class _VaultCard extends StatelessWidget {
  // const _VaultCard(this.args, {Key key}) : super(key: key);

  // final TransferDetailArgs args;

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
        onTap: () => VaultsController.con.openDetails(),
        title: Text('somevault'),
      ),
    );
  }
}
