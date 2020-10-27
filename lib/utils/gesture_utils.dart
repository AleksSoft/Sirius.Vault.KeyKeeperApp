import 'package:flutter/material.dart';

class GestureUtils {
  static void unfocus() =>
      WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
}
