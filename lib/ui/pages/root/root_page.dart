import 'package:KeyKeeperApp/controller/root/root_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootPage extends StatelessWidget {
  static final String route = '/';
  final duration = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<RootController>(
        init: RootController(),
        builder: (_) => Stack(
          fit: StackFit.expand,
          children: <Widget>[
            AnimatedPositioned(
              onEnd: () => _.checkAuth(),
              duration: duration,
              top: _.showUi ? 120 : -10,
              right: 10,
              left: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.lock_open, size: 36),
                  Text(
                    'Key Keeper',
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            AnimatedOpacity(
              duration: duration,
              opacity: _.showUi ? 1.0 : 0.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
