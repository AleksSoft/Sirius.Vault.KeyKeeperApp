import 'package:KeyKeeperApp/controller/vault_lists/vault_lists_controller.dart';
import 'package:KeyKeeperApp/ui/widgets/vault_list_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VaultListsPage extends StatelessWidget {
  static const String route = '/vault-lists';

  final VaultListsController c = Get.find<VaultListsController>();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: GetX<VaultListsController>(
          init: VaultListsController(),
          builder: (_) {
            return Stack(
              children: <Widget>[
                _ListSwitcher(),
                Positioned(
                  top: 16.0,
                  left: 16.0,
                  child: FloatingActionButton(
                    onPressed: null,
                    child: BackButton(color: Colors.black),
                    backgroundColor: Colors.white,
                  ),
                ),
                Positioned(
                  bottom: 16.0,
                  left: screenWidth / 6,
                  right: screenWidth / 6,
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
            );
          },
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
                    trailing: Text(v.status),
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
