import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/home/presentation/views/cart_products_details_builder.dart';

class CartButtomSheetWidget extends StatelessWidget {
  const CartButtomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.kPrimaryColor,
          ),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            17,
          ),
          topRight: Radius.circular(
            17,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CartProductsDetailsBuilder(),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () => GoRouter.of(context).push(
                RouterPath.kCheckoutView,
              ),
              child: Text(
                'Complete Checkout',
                style: AppStyles.styleRegular18(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
