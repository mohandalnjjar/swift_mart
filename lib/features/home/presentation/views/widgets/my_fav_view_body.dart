import 'package:flutter/material.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/custom_cart_button.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/favoriest_item.dart';

class MyFavViewBody extends StatelessWidget {
  const MyFavViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        //fav Appbar
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          sliver: SliverAppBar(
            centerTitle: true,
            title: Text(
              'favorites',
              style: AppStyles.styleSemiBold30(context),
            ),
            actions: const [
              CustomCartButton(),
            ],
          ),
        ),

        // titles
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Your favorites',
              style: AppStyles.styleRegular24(context)
                  .copyWith(fontSize: 40, fontWeight: FontWeight.normal),
            ),
          ),
        ),
        //titles

        SliverPadding(
          padding: const EdgeInsets.only(
            left: 8.0,
            bottom: 10,
          ),
          sliver: SliverToBoxAdapter(
            child: Text(
              'List ( 5 )',
              style: AppStyles.styleRegular24(context)
                  .copyWith(fontSize: 30, fontWeight: FontWeight.normal),
            ),
          ),
        ),
        //fav Sliver Grid
        SliverGrid.builder(
          itemCount: 5,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 240,
          ),
          itemBuilder: (context, index) => const FavoritesItem(),
        )
      ],
    );
  }
}
