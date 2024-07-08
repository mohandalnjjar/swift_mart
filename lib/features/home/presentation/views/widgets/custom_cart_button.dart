import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/core/functions/is_arabic.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/features/theme/presentation/managers/cubit/theme_cubit.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.icon,
    required this.onTap,
  });
  final Widget icon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeCubitState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: EdgeInsets.only(
              right: isArabic() ? 0 : 13,
              left: isArabic() ? 13 : 0,
            ),
            decoration: BoxDecoration(
              color: BlocProvider.of<ThemeCubit>(context).themeMode
                  ? AppColors.kPrimaryColor
                  : AppColors.kAmberColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: icon,
          ),
        );
      },
    );
  }
}
