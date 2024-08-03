import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/custom_cart_button.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/flash_sale_list.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/selected_for_you_list.dart';
import 'package:swift_mart/generated/l10n.dart';
import '../../../../../core/utils/const/app_constance.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

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
            actions: [
              CustomButton(
                icon: const Icon(
                  Ionicons.cart,
                  color: Colors.white,
                ),
                onTap: () => GoRouter.of(context).push(RouterPath.kCartView),
              ),
            ],
          ),
        ),
        //FlashSaleList
        const SliverToBoxAdapter(
          child: FlashSaleList(),
        ),
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
        //First list
        const SelectedForYouWidget(),
      ],
    );
  }
}
