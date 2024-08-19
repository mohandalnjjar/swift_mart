import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/theme/presentation/managers/cubit/theme_cubit.dart';
import 'package:swift_mart/generated/l10n.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
    required this.inAsyncCall,
  });

  final bool inAsyncCall;

  @override
  Widget build(BuildContext context) {
    if (!inAsyncCall) {
      return const SizedBox.shrink();
    }

    return BlocBuilder<ThemeCubit, ThemeCubitState>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: BlocProvider.of<ThemeCubit>(context).themeMode
                      ? AppColors.kDarkScaffoldColor
                      : AppColors.kLightScaffoldColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 20),
                    Text(
                      S.of(context).Loading,
                      style: AppStyles.style700w16(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
