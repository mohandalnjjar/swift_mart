import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swift_mart/features/auth/data/repos/auth_repo_impl.dart';
import 'package:swift_mart/features/auth/presentatiion/managers/reset_password_cubit/rest_password_cubit.dart';
import 'package:swift_mart/features/auth/presentatiion/views/widgets/forgot_password_view_body.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestPasswordCubit(
        AuthRepoImpl(),
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Reset password'),
          centerTitle: true,
          leading: Center(
            child: IconButton(
              style: IconButton.styleFrom(
                side: const BorderSide(color: Colors.grey, width: 1),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Ionicons.arrow_back,
                size: 27,
              ),
            ),
          ),
        ),
        body: const ForgotPasswordViewBody(),
      ),
    );
  }
}
