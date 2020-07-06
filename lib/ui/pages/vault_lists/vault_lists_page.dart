import 'package:KeyKeeperApp/controller/vault_lists/vault_lists_controller.dart';
import 'package:KeyKeeperApp/ui/widgets/vault_list_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VaultListsPage extends StatelessWidget {
  static const String route = '/vault-lists';

  final VaultListsController c = Get.find<VaultListsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            RefreshIndicator(
              color: Colors.black,
              onRefresh: () => c.reload(),
              child: _ListSwitcher(),
            ),
            Positioned(
              left: 16.0,
              top: 16.0,
              child: FloatingActionButton(
                onPressed: null,
                child: BackButton(color: Colors.black),
                backgroundColor: Colors.white,
              ),
            ),
            Obx(
              () => Visibility(
                visible: c.modeVaults,
                child: Positioned(
                  top: 16.0,
                  right: 16.0,
                  child: Card(
                    elevation: 16.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: DropdownButton<String>(
                        underline: SizedBox.shrink(),
                        elevation: 16,
                        items: VaultListsController.vaultStatusList
                            .map((status) => DropdownMenuItem(
                                  value: status,
                                  child: Text(
                                    status,
                                    style: Get.textTheme.button.copyWith(
                                      color: c.getStatusColor(status),
                                    ),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) => c.filterStatus = value,
                        value: c.filterStatus,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 32.0,
              right: 32.0,
              bottom: 16.0,
              child: Obx(
                () => VaultListsSelector(
                  vaultsClick: () => c.modeVaults = true,
                  requestsClick: () => c.modeVaults = false,
                  vaultsChecked: c.modeVaults,
                  requestsCount: c.requests.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListSwitcher extends StatelessWidget {
  _ListSwitcher({Key key}) : super(key: key);

  final VaultListsController c = Get.find<VaultListsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: c.modeVaults
            ? ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 80.0,
                ),
                itemCount: c.vaults.length,
                separatorBuilder: (context, index) =>
                    Divider(color: Colors.black54),
                itemBuilder: (context, index) {
                  var v = c.vaults[index];
                  return ListTile(
                    title: Text('Name: ${v.name}'),
                    subtitle: Text('Type: ${v.type}'),
                    trailing: Text(
                      v.status,
                      style: Get.textTheme.button.copyWith(
                        color: c.getStatusColor(v.status),
                      ),
                    ),
                  );
                },
              )
            : ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 80.0,
                ),
                itemCount: c.requests.length,
                separatorBuilder: (context, index) =>
                    Divider(color: Colors.black54),
                itemBuilder: (context, index) {
                  var r = c.requests[index];
                  return ListTile(
                    title: Text('Vault name: ${r.vaultName}'),
                    subtitle: Text('Vault id: ${r.vaultId}'),
                    trailing: Text('${r.activationRequestId}'),
                  );
                },
              ),
      ),
    );
  }
}
