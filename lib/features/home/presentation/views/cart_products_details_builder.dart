import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/home/presentation/managers/fetch_cart_total_price_cubit/fetch_total_cart_price_cubit.dart';
import 'package:swift_mart/generated/l10n.dart';

class CartProductsDetailsBuilder extends StatelessWidget {
  const CartProductsDetailsBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FethTotalCartPriceCubit, FetchTotalCartPriceState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Text(
                S.of(context).TotalPrice,
                style: AppStyles.styleRegular20(context),
              ),
              const Spacer(),
              const Icon(
                Icons.attach_money_outlined,
                color: Colors.green,
              ),
              Text(
                state is FethTotalCartPriceSuccess
                    ? state.totalPrice.toString()
                    : '0',
                style: AppStyles.styleSemiBold19(context),
              ),
            ],
          ),
        );
      },
    );
  }
}
