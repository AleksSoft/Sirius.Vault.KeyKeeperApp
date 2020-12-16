import 'package:validator/app/common/common.dart';
import 'package:validator/controllers/controllers.dart';
import 'package:validator/models/saved_vaults_model.dart';
import 'package:validator/ui/widgets/empty_reloading_view.dart';
import 'package:validator/ui/widgets/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VaultsPage extends MenuPage {
  @override
  String get title => 'Custodies';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VaultsController>(
      init: VaultsController(),
      builder: (_) => Scaffold(
        floatingActionButton: FloatingActionButton(
          heroTag: 'fab-vaults-invite',
          onPressed: () => _.openNewInvite(),
          child: Icon(Icons.add),
          backgroundColor: AppColors.dark,
        ),
        body: EmptyReloadingView(
          emptyMessage: 'You have no active vaults',
          isEmpty: _.showEmptyContidion,
          isLoading: _.loading,
          onRefresh: () => _.reloadVaults(),
          child: ListView.builder(
            padding: const EdgeInsets.all(AppSizes.medium),
            itemCount: _.vaults.length,
            itemBuilder: (context, index) => _VaultCard(_.vaults[index]),
          ),
        ),
      ),
    );
  }
}

class _VaultCard extends StatelessWidget {
  const _VaultCard(this.vault, {Key key}) : super(key: key);

  final Vault vault;

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
        onTap: () => VaultsController.con.openDetails(vault),
        title: Text(vault.localName),
        subtitle: Text(vault.name),
        trailing: _StatusChip(true),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip(this.online, {Key key}) : super(key: key);

  final bool online;

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.small,
      ),
      label: Text(
        this.online ? 'Online' : 'Offline',
        style: Get.textTheme.button.copyWith(
          color: AppColors.primary,
        ),
      ),
      backgroundColor: this.online ? AppColors.green : AppColors.red,
      elevation: 0,
    );
  }
}
