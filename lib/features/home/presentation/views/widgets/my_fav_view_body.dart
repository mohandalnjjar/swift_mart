import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.symmetric(vertical: 10),
          sliver: SliverAppBar(
            centerTitle: true,
            title: Text(
              'favorites list',
              style: AppStyles.styleSemiBold25(context),
            ),
          ),
        ),

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
