import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/const/app_images.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/custom_button.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/flash_sale_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              children: [
                const CustomSearchBar(),
                CustomButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppConstance.kCartView);
                  },
                  icon: const Icon(IconlyLight.bag),
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: FlashSaleList(),
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FittedBox(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      Assets.imagesAppIcon,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Apple',
              style: AppStyles.style700w16(context),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
