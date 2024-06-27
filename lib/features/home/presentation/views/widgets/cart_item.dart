import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/const/app_images.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(RouterPath.kDetailsView);
          },
          child: AspectRatio(
            aspectRatio: 3 / 4,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: AppColors.kWhiteGrey,
              ),
              child: Image.asset(Assets.imagesShose),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * .4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Nike Aire Zone',
                style: AppStyles.styleRegular21(context),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                r'$ 304',
                style: AppStyles.styleSemiBold21(context),
              ),
              const SizedBox(
                height: 7,
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.add_circle_rounded,
                        color: AppColors.kPrimaryColor,
                        size: 27,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '22',
                      style: AppStyles.styleRegular18(context),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.remove_circle_outline,
                        color: AppColors.kPrimaryColor,
                        size: 27,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Spacer(
          flex: 3,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.red,
                  ),
                  child: const Icon(
                    IconlyLight.delete,
                    color: Colors.white,
                    size: 23,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
