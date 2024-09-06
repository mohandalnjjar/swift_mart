import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/features/home/presentation/managers/fetch_most_rated_cubit/fetch_most_rated_cubit.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/product_item.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/product_loading_indicator_list.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/product_loading_indicator_shimmer.dart';

class MostRatedProductsList extends StatefulWidget {
  const MostRatedProductsList({
    super.key,
  });

  @override
  State<MostRatedProductsList> createState() => _MostRatedProductsListState();
}

class _MostRatedProductsListState extends State<MostRatedProductsList> {
  final ScrollController _scrollController = ScrollController();
  int limit = 20;
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.atEdge &&
          _scrollController.position.pixels != 0 &&
          !isLoadingMore) {
        setState(() {
          isLoadingMore = true;
          limit += 1;
        });
        context
            .read<FetchMostRatedCubit>()
            .mostRatedProductMethod(limit: limit)
            .then((_) {
          setState(() {
            isLoadingMore = false;
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchMostRatedCubit, FetchMostRatedState>(
      builder: (context, state) {
        if (state is FetchMostRatedSuccess) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * .31,
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: state.products.length + (isLoadingMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < state.products.length) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductItem(
                        productModel: state.products[index],
                      ),
                    );
                  } else {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ProductLoadingShimmerIndicatorItem(),
                      ),
                    );
                  }
                },
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
