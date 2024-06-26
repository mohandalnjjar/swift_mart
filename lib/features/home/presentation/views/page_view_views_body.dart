import 'package:flutter/material.dart';
import 'package:swift_mart/features/home/presentation/views/home_view.dart';
import 'package:swift_mart/features/home/presentation/views/my_fav_view.dart';
import 'package:swift_mart/features/home/presentation/views/profile_view.dart';

class PageViewViewBody extends StatelessWidget {
  const PageViewViewBody({
    super.key,
    required this.controller,
    this.onPageChanged,
  });
  final PageController controller;
  final void Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return MediaQuery.sizeOf(context).width < 900
        ? PageView(
            controller: controller,
            onPageChanged: onPageChanged,
            children: const [
              HomeView(),
              MyFavView(),
              ProfileView(),
            ],
          )
        : const HomeView();
  }
}
