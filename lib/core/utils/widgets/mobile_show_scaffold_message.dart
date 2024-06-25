import 'package:flutter/material.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';

class MobileScaaffoldMessage extends StatelessWidget {
  const MobileScaaffoldMessage({
    super.key,
    required this.message,
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          color: AppColors.kPrimaryColor,
        ),
        child: Center(
          child: Text(
            message,
            style:
                AppStyles.styleRegular15(context).copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
