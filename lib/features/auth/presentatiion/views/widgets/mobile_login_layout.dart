import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/functions/show_meeage.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/features/auth/presentatiion/managers/login_cubit/login_cubit.dart';
import 'package:swift_mart/features/auth/presentatiion/views/widgets/login_form.dart';

class MobileLoginLayout extends StatelessWidget {
  const MobileLoginLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SingleChildScrollView(
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginLoadding) {
                showDialog(
                  context: context,
                  builder: (context) => const AbsorbPointer(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }

              if (state is LoginSuccess) {
                showedScaffoldMessage(
                    context: context, message: 'Successfully Login');

                GoRouter.of(context)
                    .pushReplacement(AppConstance.kHomeViewRouter);
              }

              if (state is LoginFailure) {
                showedScaffoldMessage(
                    context: context, message: state.errorMessage);
                context.pop();
              }
            },
            builder: (context, state) {
              return const LoginForm();
            },
          ),
        ),
      ),
    );
  }
}
