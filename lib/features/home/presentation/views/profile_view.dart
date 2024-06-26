import 'package:flutter/material.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ProfileViewBody(),
      ),
    );
  }
}
