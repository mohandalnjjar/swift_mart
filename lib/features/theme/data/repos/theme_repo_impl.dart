import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_mart/features/theme/data/repos/theme_repo.dart';

class ThemeRepoImpl extends ThemeRepo {
  final String themeStatus = 'Theme_status';
  @override
  Future<void> setTheme({required bool themeValue}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setBool(themeStatus, themeValue);
  }

  @override
  Future<bool> getTheme({required BuildContext context}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(themeStatus) ?? false;
  }
}
