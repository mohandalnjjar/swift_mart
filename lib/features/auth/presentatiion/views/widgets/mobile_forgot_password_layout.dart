import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/functions/show_meeage.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/features/auth/presentatiion/managers/reset_password_cubit/rest_password_cubit.dart';
import 'package:swift_mart/features/auth/presentatiion/views/widgets/forgot_password_from.dart';

class MobileForgotPassswordBody extends StatelessWidget {
  const MobileForgotPassswordBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<RestPasswordCubit, RestPasswordState>(
          listener: (context, state) {
            if (state is RestPasswordLoading) {
              showDialog(
                context: context,
                builder: (context) => const AbsorbPointer(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            } else if (state is RestPasswordFailed) {
              showedScaffoldMessage(
                  context: context, message: state.errorMessage);
              context.pop();
            } else {
              showedScaffoldMessage(
                  context: context, message: 'Check your emial ');

              GoRouter.of(context).pushReplacement(
                AppConstance.kLoginView,
              );
            }
          },
          builder: (context, state) {
            return const ForGotPasswordFrom();
          },
        ),
      ),
    );
  }
}
