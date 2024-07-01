import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/core/utils/widgets/custom_text_form_field.dart';
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
