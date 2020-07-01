import 'package:KeyKeeperApp/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  static final String route = '/home';

// //repository injection
// final MyRepository repository = MyRepository(apiClient: MyApiClient(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetX<HomeController>(
          init: HomeController(),
          builder: (_) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Center(
                  child: Text('hi'),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
