import 'package:KeyKeeperApp/app/ui/app_colors.dart';
import 'package:KeyKeeperApp/app/ui/app_sizes.dart';
import 'package:KeyKeeperApp/app/ui/app_ui_helpers.dart';
import 'package:KeyKeeperApp/controller/inbox/inbox_controller.dart';
import 'package:KeyKeeperApp/ui/widgets/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InboxPage extends MenuPage {
  @override
  String get title => 'Admin messages';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InboxController>(
      init: InboxController(),
      builder: (_) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => _.reload(),
          child: Icon(Icons.replay),
          backgroundColor: AppColors.dark,
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: !_.loading
              ? ListView.builder(
                  padding: const EdgeInsets.all(AppSizes.medium),
                  itemCount: _.messages.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(_.messages[index]),
                    trailing: IconButton(
                      onPressed: () => _.copy(_.messages[index]),
                      icon: Icon(Icons.content_copy),
                    ),
                  ),
                )
              : Center(child: AppUiHelpers.circularProgress),
        ),
      ),
    );
  }
}
