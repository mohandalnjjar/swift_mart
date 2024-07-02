import 'package:flutter/material.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/eidt_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: EditProfileViewBody(),
      ),
    );
  }
}
