import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/features/theme/presentation/managers/cubit/theme_cubit.dart';

class Gnav extends StatelessWidget {
  const Gnav({
    super.key,
    required this.currentScreen,
    this.onTabChange,
  });
  final int currentScreen;
  final void Function(int)? onTabChange;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeCubitState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(6),
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: AppColors.kGnavColor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: GNav(
            selectedIndex: currentScreen,
            onTabChange: onTabChange,
            activeColor: AppColors.kGnavColor,
            tabBackgroundColor: Colors.white,
            tabs: const [
              GButton(
                padding: EdgeInsets.all(13),
                icon: IconlyLight.home,
                iconColor: Colors.white,
                iconSize: 25,
              ),
              GButton(
                padding: EdgeInsets.all(13),
                icon: IconlyLight.search,
                iconColor: Colors.white,
                iconSize: 25,
              ),
              GButton(
                padding: EdgeInsets.all(13),
                iconColor: Colors.white,
                icon: Ionicons.heart_outline,
                iconSize: 25,
              ),
              GButton(
                padding: EdgeInsets.all(13),
                iconColor: Colors.white,
                icon: IconlyLight.profile,
                iconSize: 25,
              ),
            ],
          ),
        );
      },
    );
  }
}
