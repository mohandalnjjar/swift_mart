import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/features/theme/presentation/managers/cubit/theme_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ThemeCubit, ThemeCubitState>(
        builder: (context, state) {
          return SwitchListTile(
            contentPadding: const EdgeInsets.only(right: 10),
            title: const Text('theme'),
            value: BlocProvider.of<ThemeCubit>(context).themeMode,
            onChanged: (value) async {
              await BlocProvider.of<ThemeCubit>(context)
                  .appTheme(themeValue: value);
            },
          );
        },
      ),
    );
  }
}
