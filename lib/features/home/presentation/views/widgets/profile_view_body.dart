import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swift_mart/core/functions/is_arabic.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/custom_alert_dialog.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/profile_image_section.dart';
import 'package:swift_mart/features/theme/presentation/managers/cubit/theme_cubit.dart';
import 'package:swift_mart/generated/l10n.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(
            top: 20,
            bottom: 20,
            right: isArabic() ? 5 : 12,
            left: isArabic() ? 12 : 5,
          ),
          sliver: SliverAppBar(
            leading: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const CustomAlertDialog();
                  },
                );
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  Ionicons.log_out_outline,
                  color: Colors.white,
                ),
              ),
            ),
            centerTitle: true,
            title: Text(
              S.of(context).Profile,
              style: AppStyles.styleSemiBold27(context),
            ),
            actions: [
              BlocBuilder<ThemeCubit, ThemeCubitState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () async {
                      await BlocProvider.of<ThemeCubit>(context).appTheme(
                        themeValue:
                            !BlocProvider.of<ThemeCubit>(context).themeMode,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: BlocProvider.of<ThemeCubit>(context).themeMode
                            ? AppColors.kPrimaryColor
                            : Colors.amber,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        BlocProvider.of<ThemeCubit>(context).themeMode
                            ? Ionicons.sunny
                            : Ionicons.moon,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: ProfileImageSection(),
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  S.of(context).AccountSetting,
                  style: AppStyles.style7500w14(context)
                      .copyWith(color: Colors.grey),
                ),
              ),
              ListTile(
                title: Text(
                  S.of(context).EditProfile,
                  style: AppStyles.styleRegular20(context),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                ),
                onTap: () {
                  GoRouter.of(context).push(RouterPath.kEditProfileView);
                },
              ),
              ListTile(
                title: Text(
                  S.of(context).ForgotPassword,
                  style: AppStyles.styleRegular20(context),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                ),
                onTap: () {
                  GoRouter.of(context).push(RouterPath.kForgotPasswordView);
                },
              ),
              ListTile(
                title: Text(
                  S.of(context).Orders,
                  style: AppStyles.styleRegular20(context),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                ),
                onTap: () {
                  GoRouter.of(context).push(RouterPath.kOrdersView);
                },
              ),
              ListTile(
                title: Text(
                  S.of(context).Language,
                  style: AppStyles.styleRegular20(context),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                ),
                onTap: () {
                  GoRouter.of(context).push(RouterPath.kLanguageView);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
