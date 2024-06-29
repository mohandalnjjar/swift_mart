import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/theme/presentation/managers/cubit/theme_cubit.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ThemeCubit, ThemeCubitState>(
          builder: (context, state) {
            return SwitchListTile(
              contentPadding: const EdgeInsets.only(right: 10),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    BlocProvider.of<ThemeCubit>(context).themeMode
                        ? Icons.dark_mode
                        : Icons.light_mode,
                    color: BlocProvider.of<ThemeCubit>(context).themeMode
                        ? Colors.white
                        : Colors.black,
                  ),
                  Text(
                    BlocProvider.of<ThemeCubit>(context).themeMode
                        ? "Dark mode"
                        : "light mode",
                    style: AppStyles.styleRegular17(context),
                  ),
                ],
              ),
              value: BlocProvider.of<ThemeCubit>(context).themeMode,
              onChanged: (value) async {
                await BlocProvider.of<ThemeCubit>(context)
                    .appTheme(themeValue: value);
              },
            );
          },
        ),
      ],
    );
  }
}
