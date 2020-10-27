import 'package:validator/app/common/common.dart';
import 'package:validator/controller/controllers.dart';
import 'package:validator/ui/widgets/empty_reloading_view.dart';
import 'package:validator/ui/widgets/menu_page.dart';
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
          heroTag: 'fab-reload-inbox',
          onPressed: () => _.reload(),
          child: Icon(Icons.replay),
          backgroundColor: AppColors.dark,
        ),
        body: EmptyReloadingView(
          emptyMessage: 'You have no admin messages',
          isEmpty: _.showEmptyContidion,
          isLoading: _.loading,
          child: ListView.builder(
            padding: const EdgeInsets.all(AppSizes.medium),
            itemCount: _.messages.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(_.messages[index]),
              trailing: IconButton(
                onPressed: () => _.copy(_.messages[index]),
                icon: Icon(Icons.content_copy),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
