import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/const/app_images.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';

class FavoritesItem extends StatelessWidget {
  const FavoritesItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(RouterPath.kDetailsView),
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: AppColors.kWhiteGrey,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  Assets.imagesShoe2,
                  height: 190,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
                Positioned(
                  right: 4,
                  child: InkWell(
                    onTap: () {},
                    child: const Icon(
                      Ionicons.heart,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              'Nike air jordan xvva',
              style: AppStyles.styleRegular18(context),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              r'$350',
              style: AppStyles.style700w16(context),
            ),
          ],
        ),
      ),
    );
  }
}
