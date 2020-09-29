import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  String get title => null;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(title ?? 'Empty page'));
  }
}
