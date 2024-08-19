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
          return SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * .31,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.products.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductItem(
                    productModel: state.products[index],
                  ),
                ),
              ),
            ),
          );
        } else if (state is FetchProductsFailed) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.errorMessage),
            ),
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
