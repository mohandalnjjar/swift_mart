import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/functions/is_arabic.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/const/app_images.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/theme/presentation/managers/cubit/theme_cubit.dart';
import 'package:swift_mart/generated/l10n.dart';

class OrdersViewItem extends StatelessWidget {
  const OrdersViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(RouterPath.kDetailsView);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.17,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.kWhitePrimaryColor,
          borderRadius: BorderRadius.circular(
            13,
          ),
        ),
        child: Row(
          children: [
            BlocBuilder<ThemeCubit, ThemeCubitState>(
              builder: (context, state) {
                return Container(
                  margin: EdgeInsets.only(
                    right: isArabic() ? 0 : 20,
                    left: isArabic() ? 20 : 0,
                  ),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: BlocProvider.of<ThemeCubit>(context).themeMode
                        ? AppColors.kDarkScaffoldColor
                        : AppColors.kLightScaffoldColor,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      Assets.imagesShoe2,
                    ),
                  ),
                );
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Text(
                    S.of(context).Code,
                    style: AppStyles.styleGreyReg17(context),
                  ),
                ),
                Flexible(
                  child: Text(
                    'OD - 29110938127',
                    style: AppStyles.styleRegular20(context).copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                TextButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    S.of(context).shipping,
                    style: AppStyles.styleRegular15(context).copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
