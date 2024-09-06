import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/features/home/presentation/managers/fetch_products_cubit/fetch_products_cubit.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/product_item.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/product_loading_indicator_shimmer.dart';

class SelectedForYouList extends StatefulWidget {
  const SelectedForYouList({
    super.key,
  });

  @override
  State<SelectedForYouList> createState() => _SelectedForYouListState();
}

class _SelectedForYouListState extends State<SelectedForYouList> {
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
            .read<FetchProductsCubit>()
            .fetchProductsMethod(limit: limit)
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
    return BlocBuilder<FetchProductsCubit, FetchProductsState>(
      builder: (context, state) {
        if (state is FetchProductsSuccess) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * .32,
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
        } else if (state is FetchProductsFailed) {
          return SliverToBoxAdapter(
            child: const Center(
              child: Text('Failed to load products'),
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: const SizedBox.shrink(),
          );
        }
      },
    );
  }
}
