import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/home/data/models/product_model.dart';
import 'package:swift_mart/features/home/presentation/managers/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:swift_mart/features/home/presentation/managers/fetch_user_cart_cubit/fetch_user_cart_cubit.dart';
import 'package:swift_mart/features/home/presentation/managers/remove_from_cubit/remove_from_cart_cubit.dart';
import 'package:swift_mart/generated/l10n.dart';

class AddRemoveToCartButton extends StatelessWidget {
  const AddRemoveToCartButton({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchUserCartCubit, FetchUserCartState>(
      builder: (context, state) {
        final isCart = state is FetchUserCartSuccess &&
            state.products.any((product) => product.id == productModel.id);
        return Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10.0,
            bottom: 10,
            top: 10,
          ),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                if (isCart) {
                  BlocProvider.of<RemoveFromCartCubit>(context)
                      .removeToCartMethod(productModel: productModel);
                } else {
                  BlocProvider.of<AddToCartCubit>(context)
                      .addToCartMethod(productModel: productModel);
                }
              },
              label: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(isCart ? Ionicons.checkbox : Ionicons.cart_outline),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    isCart ? 'Added to cart' : S.of(context).AddToCart,
                    style: AppStyles.styleSemiBold18(context),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
