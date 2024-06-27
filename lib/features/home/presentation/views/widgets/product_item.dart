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
      child: GestureDetector(
        onTap: () => GoRouter.of(context).push(RouterPath.kDetailsView),
        child: AspectRatio(
          aspectRatio: 2 / 3.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () =>
                      GoRouter.of(context).push(RouterPath.kDetailsView),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: AppColors.kWhiteGrey),
                    child: Image.asset(Assets.imagesShose),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'New Nike air shose ',
                maxLines: 2,
                style: AppStyles.style700w16(context),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    r'$350',
                    style: AppStyles.style700w16(context),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Ionicons.heart_outline,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
