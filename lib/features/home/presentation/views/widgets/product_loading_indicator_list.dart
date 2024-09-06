import 'package:flutter/material.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/product_loading_indicator_shimmer.dart';

class ProductShimmerLoadingIndicatorList extends StatelessWidget {
  const ProductShimmerLoadingIndicatorList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: ProductLoadingShimmerIndicatorItem(),
          );
        },
      ),
    );
  }
}
