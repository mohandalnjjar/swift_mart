import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';

class MyFavViewBody extends StatelessWidget {
  const MyFavViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.kPrimaryColor,
            ),
            onPressed: () async {
              GoRouter.of(context).pushReplacement(RouterPath.kLoginView);
              await FirebaseAuth.instance.signOut();
            },
            child: Text(
              'Yes, SignOut',
              style: AppStyles.styleRegular15(context)
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
