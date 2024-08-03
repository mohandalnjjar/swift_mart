import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/features/home/presentation/managers/fetch_user_cart_cubit/fetch_user_cart_cubit.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/cart_item.dart';

class UserCartBlocBuilderList extends StatelessWidget {
  const UserCartBlocBuilderList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchUserCartCubit, FetchUserCartState>(
      builder: (context, state) {
        if (state is FetchUserCartSuccess) {
          return SliverList.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * .19,
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: CartItem(
                      productModel: state.products[index],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return const SliverToBoxAdapter(
            child: Text('data'),
          );
        }
      },
    );
  }
}
