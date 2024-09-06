import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swift_mart/core/functions/show_meeage.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/home/data/models/product_model.dart';
import 'package:swift_mart/features/home/presentation/managers/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:swift_mart/features/home/presentation/managers/fetch_user_cart_cubit/fetch_user_cart_cubit.dart';
import 'package:swift_mart/generated/l10n.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.productModel,
    required this.selectedSize,
  });

  final ProductModel productModel;
  final String? selectedSize;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchUserCartCubit, FetchUserCartState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                if (productModel.sizes != null &&
                    productModel.sizes!.isNotEmpty &&
                    selectedSize == null) {
                  showedScaffoldMessage(
                      context: context, message: 'Please select a size.');
                } else {
                  BlocProvider.of<AddToCartCubit>(context).addToCartMethod(
                    productModel: productModel,
                    selectedSize: selectedSize,
                  );
                }
              },
              icon: const Icon(Ionicons.cart_outline),
              label: Text(
                S.of(context).AddToCart,
                style: AppStyles.styleRegular18(context)
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
