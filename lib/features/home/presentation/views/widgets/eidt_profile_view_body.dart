import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/utils/const/app_images.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/generated/l10n.dart';

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
              S.of(context).EditProfile,
              style: AppStyles.styleSemiBold30(context),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.25,
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(Assets.imagesMuhanedtwo),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Muhaned Alnjjar',
                  style: AppStyles.styleRegular24(context),
                ),
                const SizedBox(height: 7),
                Text(
                  S.of(context).ChangeImage,
                  style: AppStyles.styleGreyReg16(context),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
