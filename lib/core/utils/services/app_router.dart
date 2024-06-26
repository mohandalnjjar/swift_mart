import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/features/auth/presentatiion/views/check_auth_state_view.dart';
import 'package:swift_mart/features/auth/presentatiion/views/forgot_password_view.dart';
import 'package:swift_mart/features/auth/presentatiion/views/login_view.dart';
import 'package:swift_mart/features/home/presentation/views/cart_view.dart';
import 'package:swift_mart/features/home/presentation/views/details_view.dart';
import 'package:swift_mart/features/home/presentation/views/home_view.dart';
import 'package:swift_mart/features/auth/presentatiion/views/register_view.dart';
import 'package:swift_mart/features/home/presentation/views/my_fav_view.dart';
import 'package:swift_mart/features/home/presentation/views/page_view_views.dart';
import 'package:swift_mart/features/home/presentation/views/profile_view.dart';
import 'package:swift_mart/features/home/presentation/views/search_view.dart';

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
        builder: (context, state) => const PageViewViews(),
      ),
      GoRoute(
        path: AppConstance.kPageViewViews,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: AppConstance.kForgotPasswordView,
        builder: (context, state) => const ForgotPasswordView(),
      ),
      GoRoute(
        path: AppConstance.kCheckAuthState,
        builder: (context, state) => const CheckAuth(),
      ),
      GoRoute(
        path: AppConstance.kDetailsView,
        builder: (context, state) => const DetailsView(),
      ),
      GoRoute(
        path: AppConstance.kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: AppConstance.kMyFavView,
        builder: (context, state) => const MyFavView(),
      ),
      GoRoute(
        path: AppConstance.kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: AppConstance.kCartView,
        builder: (context, state) => const CartView(),
      ),
    ],
  );
}
