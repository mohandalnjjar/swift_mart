import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/features/auth/presentatiion/views/check_auth_state_view.dart';
import 'package:swift_mart/features/auth/presentatiion/views/forgot_password_view.dart';
import 'package:swift_mart/features/auth/presentatiion/views/login_view.dart';
import 'package:swift_mart/features/home/data/models/product_model.dart';
import 'package:swift_mart/features/home/presentation/views/cart_view.dart';
import 'package:swift_mart/features/home/presentation/views/details_view.dart';
import 'package:swift_mart/features/home/presentation/views/edit_profile_view.dart';
import 'package:swift_mart/features/home/presentation/views/home_view.dart';
import 'package:swift_mart/features/auth/presentatiion/views/register_view.dart';
import 'package:swift_mart/features/language/presentation/views/language_view.dart';
import 'package:swift_mart/features/home/presentation/views/my_fav_view.dart';
import 'package:swift_mart/features/home/presentation/views/orders_view.dart';
import 'package:swift_mart/features/payment/presentation/views/checkout_view.dart';
import 'package:swift_mart/features/reviews/data/models/review_view_data_model.dart';
import 'package:swift_mart/features/reviews/presentation/views/add_review.dart';
import 'package:swift_mart/features/reviews/presentation/views/reviews_view.dart';
import 'package:swift_mart/main_page_view.dart';
import 'package:swift_mart/features/home/presentation/views/profile_view.dart';
import 'package:swift_mart/features/home/presentation/views/search_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: RouterPath.kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: RouterPath.kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: RouterPath.kHomeViewRouter,
        builder: (context, state) => const MainPageView(),
      ),
      GoRoute(
        path: RouterPath.kPageViewViews,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: RouterPath.kForgotPasswordView,
        builder: (context, state) => const ForgotPasswordView(),
      ),
      GoRoute(
        path: RouterPath.kCheckAuthState,
        builder: (context, state) => const CheckAuth(),
      ),
      GoRoute(
        path: RouterPath.kDetailsView,
        builder: (context, state) => DetailsView(
          productModel: state.extra as ProductModel,
        ),
      ),
      GoRoute(
        path: RouterPath.kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: RouterPath.kMyFavView,
        builder: (context, state) => const MyFavView(),
      ),
      GoRoute(
        path: RouterPath.kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: RouterPath.kCartView,
        builder: (context, state) => const CartView(),
      ),
      GoRoute(
        path: RouterPath.kOrdersView,
        builder: (conext, state) => const OrdersView(),
      ),
      GoRoute(
        path: RouterPath.kEditProfileView,
        builder: (conext, state) => const EditProfileView(),
      ),
      GoRoute(
        path: RouterPath.kLanguageView,
        builder: (conext, state) => const LanguageView(),
      ),
      GoRoute(
        path: RouterPath.kRattingView,
        builder: (conext, state) => ReviewsView(
          reviewViewDataModel: state.extra as ReviewViewDataModel,
        ),
      ),
      GoRoute(
        path: RouterPath.kAddRattingReview,
        builder: (conext, state) => AddRattingReview(
          reviewViewDataModel: state.extra as ReviewViewDataModel,
        ),
      ),
      GoRoute(
        path: RouterPath.kCheckoutView,
        builder: (conext, state) => const CheckoutView(),
      ),
    ],
  );
}
