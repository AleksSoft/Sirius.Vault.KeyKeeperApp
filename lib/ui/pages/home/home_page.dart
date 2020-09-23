import 'package:KeyKeeperApp/app/ui/app_colors.dart';
import 'package:KeyKeeperApp/app/ui/app_sizes.dart';
import 'package:KeyKeeperApp/app/ui/app_ui_helpers.dart';
import 'package:KeyKeeperApp/controller/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  static final String route = '/home';

  final HomeController c = HomeController.con;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (_) => SliderMenuContainer(
          isShadow: true,
          appBarColor: Colors.transparent,
          shadowColor: AppColors.secondary.withOpacity(0.2),
          sliderMenu: _DrawerMenu(),
          sliderMain: Container(),
        ),
      ),
    );
  }
}

class _DrawerMenu extends StatelessWidget {
  final c = HomeController.con;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _VaultStatusView(),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.list),
            title: Text('Requests'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.view_carousel),
            title: Text('Vaults'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.backup),
            title: Text('Backup'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.inbox),
            title: Text('Inbox'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.dialpad),
            title: Text('Change PIN'),
          ),
          ListTile(
            onTap: () => c.logout(),
            leading: Icon(Icons.arrow_back_ios),
            title: Text('Logout'),
          ),
          AppUiHelpers.vSpaceExtraLarge,
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
      height: AppSizes.extraLarge * 2.5,
      color: AppColors.green.withOpacity(0.3),
      padding: const EdgeInsets.only(top: 20),
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
