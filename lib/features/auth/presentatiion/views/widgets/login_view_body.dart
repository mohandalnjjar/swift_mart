import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/theme/presentation/managers/cubit/theme_cubit.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Login',
            style: AppStyles.styleSemiBold27(context),
          ),
          Text(
            'this is me muhannd',
            style: AppStyles.styleSemiBold27(context),
          ),
          Text(
            'Login',
            style: AppStyles.styleSemiBold27(context),
          ),
          SwitchListTile(
            contentPadding: const EdgeInsets.only(right: 10),
            title: const Text('theme'),
            value: BlocProvider.of<ThemeCubit>(context).themeMode,
            onChanged: (value) async {
              await BlocProvider.of<ThemeCubit>(context)
                  .appTheme(themeValue: value);
            },
          ),
        ],
      ),
    );
  }
}
