import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/features/auth/presentatiion/views/forgot_password_view.dart';
import 'package:swift_mart/features/auth/presentatiion/views/login_view.dart';
import 'package:swift_mart/features/home/presentation/views/home_view.dart';
import 'package:swift_mart/features/auth/presentatiion/views/register_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppConstance.kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: AppConstance.kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: AppConstance.kHomeViewRouter,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: AppConstance.kForgotPasswordView,
        builder: (context, state) => const ForgotPasswordView(),
      ),
    ],
  );
}
