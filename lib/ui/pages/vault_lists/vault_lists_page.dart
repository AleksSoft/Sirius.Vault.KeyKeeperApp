import 'package:KeyKeeperApp/controller/vault_lists/vault_lists_controller.dart';
import 'package:KeyKeeperApp/ui/widgets/vault_list_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VaultListsPage extends StatelessWidget {
  static const String route = '/vault-lists';

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
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: _.modeVaults
                      ? ListView(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 80.0,
                          ),
                          children: _.vaults
                              .map((v) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      ListTile(
                                        title: Text('Name: ${v.name}'),
                                        subtitle: Text('Type: ${v.type}'),
                                        trailing: Text(v.status),
                                      ),
                                      Divider(color: Colors.black54),
                                    ],
                                  ))
                              .toList(),
                        )
                      : ListView(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 80.0,
                          ),
                          children: _.requests
                              .map((r) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      ListTile(
                                        title:
                                            Text('Vault name: ${r.vaultName}'),
                                        subtitle:
                                            Text('Vault id: ${r.vaultId}'),
                                        trailing:
                                            Text('${r.activationRequestId}'),
                                      ),
                                      Divider(color: Colors.black54),
                                    ],
                                  ))
                              .toList(),
                        ),
                ),
                Positioned(
                  top: 16.0,
                  left: 16.0,
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: BackButton(
                      color: Colors.black,
                    ),
                    backgroundColor: Colors.white,
                  ),
                ),
                Positioned(
                  bottom: 16.0,
                  left: screenWidth / 6,
                  right: screenWidth / 6,
                  child: VaultListsSelector(
                    vaultsClick: () => _.modeVaults = true,
                    requestsClick: () => _.modeVaults = false,
                    vaultsChecked: _.modeVaults,
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
