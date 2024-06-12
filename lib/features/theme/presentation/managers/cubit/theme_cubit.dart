import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:swift_mart/features/theme/data/repos/theme_repo_impl.dart';

part 'theme_cubit_state.dart';

class ThemeCubit extends Cubit<ThemeCubitState> {
  ThemeCubit(this.themeRepoImpl) : super(ThemeCubitInitial());

  final ThemeRepoImpl themeRepoImpl;
  bool themeMode = false;

  Future<void> appTheme({required bool themeValue}) async {
    await themeRepoImpl.setTheme(themeValue: themeValue);
    themeMode = themeValue;

    emit(
      ThemeCubitSuccess(),
    );
  }

  Future<void> getTheme({required BuildContext context}) async {
    themeMode = await themeRepoImpl.getTheme(context: context);
    emit(
      ThemeCubitSuccess(),
    );
  }
}
