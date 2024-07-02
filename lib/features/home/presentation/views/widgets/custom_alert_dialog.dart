import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.only(bottom: 14, right: 14, top: 30),
      // icon: const Icon(IconlyLight.logout),
      title: Text(
        'Are you sure want log out ?',
        style: AppStyles.styleRegular22(context),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.kPrimaryColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            onPressed: () {
              context.pop();
            },
            child: Text(
              '   log out   ',
              style: AppStyles.styleRegular15(context).copyWith(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.kWhitePrimaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            onPressed: () {
              context.pop();
            },
            child: Text(
              '   Cancle   ',
              style: AppStyles.styleRegular15(context).copyWith(
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
