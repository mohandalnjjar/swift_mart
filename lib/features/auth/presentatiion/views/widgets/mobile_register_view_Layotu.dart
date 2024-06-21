import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/functions/show_meeage.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/features/auth/presentatiion/managers/signup_cubit/sign_up_cubit.dart';
import 'package:swift_mart/features/auth/presentatiion/views/widgets/register_form.dart';

class MobileRegisterViewLayotu extends StatelessWidget {
  const MobileRegisterViewLayotu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: BlocListener<SignUpCubit, SignUpState>(
            listener: (context, state) {
              if (state is SignUpLoadding) {
                showDialog(
                  context: context,
                  builder: (context) => const AbsorbPointer(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }
              if (state is SignUpSuccess) {
                showedScaffoldMessage(
                    context: context, message: 'Successfully Created');
                GoRouter.of(context)
                    .pushReplacement(AppConstance.kHomeViewRouter);
              }
              if (state is SignUpFailure) {
                showedScaffoldMessage(
                    context: context, message: state.errorMessage);
              }
            },
            child: const RegisterForm(),
          ),
        ),
      ),
    );
  }
}
