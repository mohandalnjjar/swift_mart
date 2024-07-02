import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/features/theme/presentation/managers/cubit/theme_cubit.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeCubitState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => GoRouter.of(context).push(RouterPath.kCartView),
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(right: 13),
            decoration: BoxDecoration(
              color: BlocProvider.of<ThemeCubit>(context).themeMode
                  ? AppColors.kPrimaryColor
                  : AppColors.kAmberColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(
              Ionicons.cart,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
