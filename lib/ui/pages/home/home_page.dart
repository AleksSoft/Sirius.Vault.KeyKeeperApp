import 'package:KeyKeeperApp/app/ui/app_colors.dart';
import 'package:KeyKeeperApp/app/ui/app_sizes.dart';
import 'package:KeyKeeperApp/controller/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/menu_pages.dart';

class HomePage extends StatelessWidget {
  static final String route = '/home';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Scaffold(
        drawer: _DrawerMenu(),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Container(child: _.selectedPage),
        ),
        appBar: AppBar(title: Text(_.selectedPage.title ?? '')),
      ),
    );
  }
}

class _DrawerMenu extends StatelessWidget {
  final c = HomeController.con;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _VaultStatusView(),
                ListTile(
                  onTap: () => c.selectedPage = RequestsPage(),
                  leading: Icon(Icons.list),
                  title: Text('Requests'),
                ),
                ListTile(
                  onTap: () => c.selectedPage = VaultsPage(),
                  leading: Icon(Icons.view_carousel),
                  title: Text('Vaults'),
                ),
                ListTile(
                  onTap: () => c.selectedPage = InboxPage(),
                  leading: Icon(Icons.inbox),
                  title: Text('Admin messages'),
                ),
                ListTile(
                  onTap: () => c.changePin(),
                  leading: Icon(Icons.dialpad),
                  title: Text('Change PIN'),
                ),
                ListTile(
                  onTap: () => c.selectedPage = BackupPage(),
                  leading: Icon(Icons.backup),
                  title: Text('Backup'),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                onTap: () => c.sharePublicKeyPem(),
                leading: Icon(Icons.share),
                title: Text('Share public key'),
              ),
              ListTile(
                onTap: () => c.shareValidatorId(),
                leading: Icon(Icons.share),
                title: Text('Share validator id'),
              ),
              ListTile(
                onTap: () => c.logout(),
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: AppSizes.medium,
                  right: AppSizes.medium,
                  bottom: AppSizes.medium,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      c.appVersion,
                      style: Get.textTheme.overline.copyWith(
                        color: AppColors.secondary,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    FlatButton(
                      onPressed: () => c.selectedPage = DevSettingsPage(),
                      child: Text(
                        'Dev settings',
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _VaultStatusView extends StatelessWidget {
  const _VaultStatusView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.extraLarge * 3 + 10,
      color: AppColors.green.withOpacity(0.3),
      padding: const EdgeInsets.only(top: AppSizes.extraLarge + 10),
      child: ListTile(
        leading: Icon(
          Icons.check_circle,
          color: AppColors.green,
          size: AppSizes.extraLarge * 1.4,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Vault status:',
              textAlign: TextAlign.center,
              style: Get.textTheme.caption,
            ),
            Text(
              'OK',
              textAlign: TextAlign.center,
              style: Get.textTheme.subtitle1.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
