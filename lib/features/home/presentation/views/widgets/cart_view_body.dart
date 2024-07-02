import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/cart_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        //Cart Appbar
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          sliver: SliverAppBar(
            leading: GestureDetector(
              onTap: () => context.pop(),
              child: const Icon(Icons.arrow_back_ios_new),
            ),
            centerTitle: true,
            title: Text(
              'Cart',
              style: AppStyles.styleSemiBold30(context),
            ),
          ),
        ),
        // titles
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Your Cart',
              style: AppStyles.styleRegular24(context)
                  .copyWith(fontSize: 40, fontWeight: FontWeight.normal),
            ),
          ),
        ),
        //titles

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'List ( 10 )',
              style: AppStyles.styleRegular24(context)
                  .copyWith(fontSize: 30, fontWeight: FontWeight.normal),
            ),
          ),
        ),

        //Cart list of Items

        SliverList.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * .19,
                child: const CartItem(),
              ),
            );
          },
        ),
      ],
    );
  }
}
