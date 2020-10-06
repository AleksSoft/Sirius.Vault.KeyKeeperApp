import 'package:KeyKeeperApp/app/ui/app_sizes.dart';
import 'package:KeyKeeperApp/controller/home/pages/dev_settings/dev_settings_controller.dart';
import 'package:KeyKeeperApp/ui/widgets/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DevSettingsPage extends MenuPage {
  String get title => 'Developer settings';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.medium),
      child: SingleChildScrollView(
        child: GetBuilder<DevSettingsController>(
          init: DevSettingsController(),
          builder: (_) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Base url:', style: Get.textTheme.headline6),
              DropdownButton<String>(
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
            ],
          ),
        ),
      ),
    );
  }
}
