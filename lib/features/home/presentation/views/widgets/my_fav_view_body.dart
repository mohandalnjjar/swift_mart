import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
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
            actions: [
              GestureDetector(
                onTap: () => GoRouter.of(context).push(RouterPath.kCartView),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blueGrey,
                    ),
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
            childAspectRatio: 2.8 / 3,
            mainAxisExtent: 277,
          ),
          itemBuilder: (context, index) => const FavoritesItem(),
        )
      ],
    );
  }
}
