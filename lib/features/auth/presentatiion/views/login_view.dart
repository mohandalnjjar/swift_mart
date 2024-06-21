import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/features/auth/data/repos/auth_repo_impl.dart';
import 'package:swift_mart/features/auth/presentatiion/managers/google_login_cubit/google_login_cubit.dart';
import 'package:swift_mart/features/auth/presentatiion/managers/login_cubit/login_cubit.dart';
import 'package:swift_mart/features/auth/presentatiion/views/login_bottom_nav_bar.dart';
import 'package:swift_mart/features/auth/presentatiion/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(
            authRepoImpl: AuthRepoImpl(),
          ),
        ),
        BlocProvider(
          create: (context) => GoogleLoginCubit(
            authRepoImpl: AuthRepoImpl(),
          ),
        )
      ],
      child: const Scaffold(
        body: SafeArea(
          child: LoginViewBody(),
        ),
        bottomNavigationBar: LoginButtomNavBar(),
      ),
    );
  }
}
