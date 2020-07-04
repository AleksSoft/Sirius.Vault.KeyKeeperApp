import 'package:KeyKeeperApp/controller/key_keepers/key_keepers_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KeyKeepersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetX<KeyKeepersController>(
            init: KeyKeepersController(),
            builder: (_) {
              return Container();
            }),
      ),
    );
  }
}
