import 'package:flutter/material.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';

ThemeData appThemeData({required bool isDark, required BuildContext context}) {
  return ThemeData(
    scaffoldBackgroundColor:
        isDark ? AppColors.kDarkScaffoldColor : AppColors.kLightScaffoldColor,
    brightness: isDark ? Brightness.dark : Brightness.light,
  );
}
