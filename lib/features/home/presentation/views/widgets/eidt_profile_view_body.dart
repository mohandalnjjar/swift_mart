import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        //Cart Appbar
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          sliver: SliverAppBar(
            leading: GestureDetector(
              onTap: () => context.pop(),
              child: const Icon(Icons.arrow_back_ios_new),
            ),
            centerTitle: true,
            title: Text(
              'Edit Profile',
              style: AppStyles.styleSemiBold30(context),
            ),
          ),
        ),
   
   
   
      ],
    );
  }
}
