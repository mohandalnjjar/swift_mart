import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/features/home/presentation/views/home_view.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: AppConstance.kHomeViewRouter,
      builder: (context, state) => const HomeView(),
    )
  ]);
}
