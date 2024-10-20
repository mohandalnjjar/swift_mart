import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/core/utils/widgets/dotted_line.dart';
import 'package:swift_mart/features/home/presentation/managers/fetch_cart_total_price_cubit/fetch_total_cart_price_cubit.dart';

class OrderFinanceDetailsSection extends StatelessWidget {
  const OrderFinanceDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      sliver: SliverToBoxAdapter(
        child: BlocBuilder<FethTotalCartPriceCubit, FetchTotalCartPriceState>(
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: AppStyles.styleGreyReg17(context),
                    ),
                    Text(
                      state is FethTotalCartPriceSuccess
                          ? '\$ ${state.orderFinanceDetails.supTotalPrice}'
                          : '\$0',
                      style: AppStyles.styleSemiBold21(context),
                    ),
                  ],
                ),
                SizedBox(height: 17),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping Cost',
                      style: AppStyles.styleGreyReg17(context),
                    ),
                    Text(
                      state is FethTotalCartPriceSuccess
                          ? '\$ ${state.orderFinanceDetails.totalShippingCoast}'
                          : '\$0',
                      style: AppStyles.styleSemiBold21(context),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: DottedLine(
                    itemCount: 30,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: AppStyles.styleGreyReg17(context),
                    ),
                    Text(
                      state is FethTotalCartPriceSuccess
                          ? '\$ ${state.orderFinanceDetails.totalPrice}'
                          : '\$0',
                      style: AppStyles.styleSemiBold21(context),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
