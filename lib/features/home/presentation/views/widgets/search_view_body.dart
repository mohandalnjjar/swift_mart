import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/core/utils/widgets/custom_text_form_field.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/custom_cart_button.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/last_search_text_list.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/search_last_seen_list.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        //Search Appbar
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          sliver: SliverAppBar(
            centerTitle: true,
            title: Text(
              'Search',
              style: AppStyles.styleSemiBold30(context),
            ),
            actions: const [
              CustomCartButton(),
            ],
          ),
        ),

        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFromField(
                  prefixIcon: const Icon(
                    IconlyLight.search,
                  ),
                  hint: 'Search for product',
                  hintStyle: AppStyles.styleRegular17(context),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'Last Seen',
                  style: AppStyles.styleSemiBold24(context),
                ),
                const SearchLastSeenList(),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Last Search',
                  style: AppStyles.styleSemiBold24(context),
                ),
              ],
            ),
          ),
        ),

        //Sliver list of last search of text
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 5,
          ),
          sliver: LastSearchTextList(),
        )
      ],
    );
  }
}
