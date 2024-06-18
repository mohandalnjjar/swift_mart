import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
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
          return TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (context.mounted) {
                GoRouter.of(context).pushReplacement(AppConstance.kLoginView);
              }
            },
            child: Text(
              'Yes, SignOut',
              style: AppStyles.styleRegular15(context)
                  .copyWith(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
