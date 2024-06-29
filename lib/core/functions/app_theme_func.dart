import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';

ThemeData appThemeData({required bool isDark, required BuildContext context}) {
  return ThemeData(
    splashColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor:
          isDark ? AppColors.kDarkScaffoldColor : AppColors.kLightScaffoldColor,
    ),
    iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.kPrimaryColor,
        elevation: 0,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.all(
          13,
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
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor:
          isDark ? AppColors.kDarkScaffoldColor : AppColors.kLightScaffoldColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
    ),
    expansionTileTheme: ExpansionTileThemeData(
      backgroundColor:
          isDark ? AppColors.kDarkScaffoldColor : AppColors.kLightScaffoldColor,
    ),
  );
}
