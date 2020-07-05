import 'package:KeyKeeperApp/controller/key_keepers/key_keepers_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KeyKeepersPage extends StatelessWidget {
  static const String route = '/key-keepers';

  final KeyKeepersController c = Get.find<KeyKeepersController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 16.0,
              left: 16.0,
              child: FloatingActionButton(
                onPressed: null,
                child: BackButton(color: Colors.black),
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
