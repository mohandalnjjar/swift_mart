import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/const/app_images.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => GoRouter.of(context).push(RouterPath.kDetailsView),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * .24,
              child: AspectRatio(
                aspectRatio: 3.2 / 4,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: MediaQuery.sizeOf(context).height * .23,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: AppColors.kWhiteGrey),
                  child: Image.asset(Assets.imagesShose),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Text(
                r'$350',
                style: AppStyles.style700w16(context),
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Ionicons.heart_outline,
                ),
              )
            ],
          ),
          Text(
            'Apple ',
            style: AppStyles.style700w16(context),
          ),
        ],
      ),
    );
  }
}
