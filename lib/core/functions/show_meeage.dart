import 'package:flutter/material.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showedScaffoldMessage(
    {required BuildContext context, required String message}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            color: AppColors.kPrimaryColor,
          ),
          child: Center(
            child: Text(
              message,
              style: AppStyles.styleRegular15(context)
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    ),
  );
}
