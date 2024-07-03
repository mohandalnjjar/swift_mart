import 'package:flutter/material.dart';
import 'package:swift_mart/core/utils/const/app_images.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/custom_cart_button.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/flash_sale_list.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/product_item.dart';
import 'package:swift_mart/generated/l10n.dart';

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
          padding: const EdgeInsets.symmetric(vertical: 20),
          sliver: SliverAppBar(
            title: Text(
              S.of(context).SwiftMart,
              style: AppStyles.styleSemiBold30(context),
            ),
            actions: const [
              CustomCartButton(),
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
        //           style: AppStyles.styleRegular24(context),
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

        //    CategoryListView
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
                  S.of(context).Selectedforyou,
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
                  S.of(context).MostRated,
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
