import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/const/app_images.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/categoryListView.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/custom_button.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/flash_sale_list.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/product_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });
  final List<String> items = const [
    Assets.imagesShoe2,
    Assets.imagesShose3,
    Assets.imagesShose4,
    Assets.imagesShose,
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 18, bottom: 8, right: 8),
            child: Row(
              children: [
                const CustomSearchBar(),
                Badge(
                  label: const Text('10'),
                  offset: const Offset(-11, 3),
                  child: CustomButton(
                    onPressed: () {
                      GoRouter.of(context).push(
                        RouterPath.kCartView,
                      );
                    },
                    icon: const Icon(IconlyLight.bag),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: FlashSaleList(),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 5,
          ),
        ),
        const SliverToBoxAdapter(
          child: CategoryListView(),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  'Most Rated',
                  style: AppStyles.styleSemiBold25(context),
                ),
                const Spacer(),
                TextButton.icon(
                  onPressed: () {},
                  label: const Text(
                    'See More',
                  ),
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * .31,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) => ProductItem(
                image: items[index],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  'Most Rated',
                  style: AppStyles.styleSemiBold25(context),
                ),
                const Spacer(),
                TextButton.icon(
                  onPressed: () {},
                  label: const Text(
                    'See More',
                  ),
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * .31,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) => ProductItem(
                image: items[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
