import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';

ThemeData appThemeData({required bool isDark, required BuildContext context}) {
  return ThemeData(
    appBarTheme: isDark
        ? const AppBarTheme(backgroundColor: AppColors.kDarkScaffoldColor)
        : const AppBarTheme(backgroundColor: AppColors.kLightScaffoldColor),
    iconTheme: isDark
        ? const IconThemeData(color: Colors.white)
        : const IconThemeData(color: Colors.black),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.kPrimaryColor,
        elevation: 0,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.all(
          10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: isDark
          ? const Color(0xffF8F8FA).withOpacity(0.1)
          : const Color(0xffF8F8FA),
    ),
    scaffoldBackgroundColor:
        isDark ? AppColors.kDarkScaffoldColor : AppColors.kLightScaffoldColor,
    brightness: isDark ? Brightness.dark : Brightness.light,
    textTheme: isDark
        ? GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme)
        : GoogleFonts.robotoTextTheme(),
  );
}
