import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validator/app/common/common.dart';
import 'package:validator/controllers/home/home_controller.dart';

import 'pages/menu_pages.dart';

class HomePage extends StatelessWidget {
  static final String route = '/home';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text(_.selectedPage.title ?? '')),
        drawer: _DrawerMenu(),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Container(child: _.selectedPage),
        ),
      ),
    );
  }
}

class _DrawerMenu extends StatelessWidget {
  final c = HomeController.con;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // _VaultStatusView(),
          ListTile(
            onTap: () => c.selectedPage = RequestsPage(),
            leading: Icon(Icons.list),
            title: Text('Requests'),
          ),
          ListTile(
            onTap: () => c.selectedPage = VaultsPage(),
            leading: Icon(Icons.view_carousel),
            title: Text('Custodies'),
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
          Divider(
            indent: AppSizes.medium,
            endIndent: AppSizes.medium,
          ),
          ListTile(
            title: Text('Share:'),
            subtitle: ButtonBar(
              children: [
                ElevatedButton(
                  onPressed: () => c.sharePublicKeyPem(),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.dark,
                    ),
                  ),
                  child: Text('Public key'),
                ),
                ElevatedButton(
                  onPressed: () => c.shareValidatorId(),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.dark,
                    ),
                  ),
                  child: Text('Validator ID'),
                ),
              ],
            ),
          ),
          Divider(
            indent: AppSizes.medium,
            endIndent: AppSizes.medium,
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
                Visibility(
                  visible: !c.appConfig.isProd,
                  child: FlatButton(
                    onPressed: () => Get.to(DevSettingsPage()),
                    child: Text(
                      'Dev settings',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
