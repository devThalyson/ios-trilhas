import 'package:app_trilhas/shared/theme/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    brightness: AppColors.brightness,
    fontFamily: "ubuntu-medium",
    primaryColor: AppColors.primaryColor,
    accentColor: AppColors.accentColor,
    splashColor: AppColors.primaryColor,
    errorColor: AppColors.errorColor,
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.white.withOpacity(0.5),
    ),
  );
}
