import 'package:flutter/material.dart';
import 'package:swift_mart/core/functions/is_arabic.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/custom_cart_button.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/favoriest_item.dart';
import 'package:swift_mart/generated/l10n.dart';

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
              S.of(context).favorites,
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
              S.of(context).YourFavorites,
              style: AppStyles.styleRegular40(context),
            ),
          ),
        ),
        //titles
        SliverPadding(
          padding: EdgeInsets.only(
            left: isArabic() ? 0 : 8.0,
            right: isArabic() ? 8.0 : 0,
            bottom: 10,
          ),
          sliver: SliverToBoxAdapter(
            child: Text('${S.of(context).List} (5)',
                style: AppStyles.styleRegular30(context)),
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
