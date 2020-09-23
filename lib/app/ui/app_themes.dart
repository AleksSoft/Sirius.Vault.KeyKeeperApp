import 'package:KeyKeeperApp/app/ui/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    accentColor: AppColors.accent,
    scaffoldBackgroundColor: AppColors.background,
    backgroundColor: AppColors.background,
    cursorColor: AppColors.coursorColor,
    fontFamily: 'Proxima_Nova',
  );
}
