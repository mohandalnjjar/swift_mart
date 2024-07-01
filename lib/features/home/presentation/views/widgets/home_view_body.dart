import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/const/app_images.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
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
        //SliverAppBar
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          sliver: SliverAppBar(
            title: Row(
              children: [
                Text(
                  'Swift ',
                  style: AppStyles.styleSemiBold25(context),
                ),
                Text(
                  'Mart',
                  style: AppStyles.styleSemiBold25(context).copyWith(
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              ],
            ),
            actions: [
              GestureDetector(
                onTap: () => GoRouter.of(context).push(RouterPath.kCartView),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: AppColors.kWhiteGrey,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Icon(
                    Ionicons.cart_outline,
                  ),
                ),
              ),
            ],
          ),
        ),

        //FlashSaleList
        const SliverToBoxAdapter(
          child: FlashSaleList(),
        ),

        // //SizedBox
        // const SliverToBoxAdapter(
        //   child: SizedBox(
        //     height: 15,
        //   ),
        // ),

        //Head Title2
        // SliverToBoxAdapter(
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
        //     child: Row(
        //       children: [
        //         Text(
        //           'Categories',
        //           style: AppStyles.styleRegular26(context),
        //         ),
        //         const Spacer(),
        //         GestureDetector(
        //           onTap: () {},
        //           child: const Icon(Icons.arrow_forward_ios_sharp),
        //         )
        //       ],
        //     ),
        //   ),
        // ),

        // CategoryListView
        // const SliverToBoxAdapter(
        //   child: CategoryListView(),
        // ),

        //Head Title1
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: Row(
              children: [
                Text(
                  'Selected for you',
                  style: AppStyles.styleRegular24(context),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.arrow_forward_ios_sharp),
                )
              ],
            ),
          ),
        ),

        //Firs list
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * .30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) => ProductItem(
                image: items[index],
              ),
            ),
          ),
        ),

        //Head Title2
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: Row(
              children: [
                Text(
                  'Most Rated',
                  style: AppStyles.styleRegular24(context),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.arrow_forward_ios_sharp),
                )
              ],
            ),
          ),
        ),

        //Second list
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
