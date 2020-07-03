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
      body: Container(
        child: GetX<VaultListsController>(
          init: VaultListsController(),
          builder: (_) {
            return Stack(
              children: <Widget>[
                Positioned(
                  bottom: 16.0,
                  left: screenWidth / 5,
                  right: screenWidth / 5,
                  child: VaultListsSelector(
                    vaultsClick: () {},
                    requestsClick: () {},
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
