import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/features/home/presentation/managers/fetch_products_cubit/fetch_products_cubit.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/product_item.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/product_loading_indicator_list.dart';

class SelectedForYouList extends StatelessWidget {
  const SelectedForYouList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchProductsCubit, FetchProductsState>(
      builder: (context, state) {
        if (state is FetchProductsSuccess) {
          return SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 2.6,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => ProductItem(
                productModel: state.products[index],
              ),
              childCount: state.products.length,
            ),
          );
        } else if (state is FetchProductsFailed) {
          return SliverToBoxAdapter(
            child: Text(state.errorMessage),
          );
        } else {
          return const SliverToBoxAdapter(
            child: ProductShimmerLoadingIndicatorList(),
          );
        }
      },
    );
  }
}
