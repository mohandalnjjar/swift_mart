import 'package:flutter/material.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/cart_loaading_indicator_item.dart';

class CartLoadingList extends StatelessWidget {
  const CartLoadingList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 5,
      itemBuilder: (context, index) => SizedBox(
        height: MediaQuery.sizeOf(context).height * .19,
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: CartLoadingIndicatorItem(),
        ),
      ),
    );
  }
}
