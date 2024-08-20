import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/features/home/presentation/managers/fetch_most_rated_cubit/fetch_most_rated_cubit.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/product_item.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/product_loading_indicator_list.dart';

class MostRatedProductsList extends StatelessWidget {
  const MostRatedProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchMostRatedCubit, FetchMostRatedState>(
      builder: (context, state) {
        if (state is FetchMostRatedSuccess) {
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
        } else if (state is FetchMostRatedFailed) {
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
