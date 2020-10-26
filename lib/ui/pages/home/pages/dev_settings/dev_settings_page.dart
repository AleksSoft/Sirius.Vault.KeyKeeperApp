import 'package:validator/app/utils/utils.dart';
import 'package:validator/controller/home/pages/dev_settings/dev_settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DevSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        leading: CloseButton(),
        title: Text('Developer settings'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.medium),
          child: SingleChildScrollView(
            child: GetBuilder<DevSettingsController>(
              init: DevSettingsController(),
              builder: (_) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    title: Text('Base url:'),
                    subtitle: DropdownButton<String>(
                      isExpanded: true,
                      value: _.defaultUrl,
                      items: _.urlList
                          .map((e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(
                                  e,
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                ),
                              ))
                          .toList(),
                      onChanged: (url) => _.updateDefaultUrl(url),
                    ),
                  ),
                  ListTile(
                    title: Text('Firebase token:'),
                    subtitle: SelectableText(_.fbToken),
                    trailing: IconButton(
                      onPressed: () => _.copy('Firebase token', _.fbToken),
                      icon: Icon(Icons.content_copy),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
