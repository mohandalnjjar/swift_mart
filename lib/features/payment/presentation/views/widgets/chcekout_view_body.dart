import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:swift_mart/core/functions/show_meeage.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/const/app_images.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/core/utils/widgets/custom_loading_indicator.dart';
import 'package:swift_mart/features/home/data/models/order_model.dart';
import 'package:swift_mart/features/home/presentation/managers/check_available_quantitycubit/check_available_quantity_cubit.dart';
import 'package:swift_mart/features/home/presentation/managers/fetch_cart_total_price_cubit/fetch_total_cart_price_cubit.dart';
import 'package:swift_mart/features/home/presentation/managers/fetch_user_cart_cubit/fetch_user_cart_cubit.dart';
import 'package:swift_mart/features/home/presentation/managers/fetch_user_data_cubit/fetch_user_data_cubit.dart';
import 'package:swift_mart/features/home/presentation/managers/submit_order_cubit/submit_order_cubit_cubit.dart';
import 'package:swift_mart/features/payment/presentation/views/widgets/order_details_finance_section.dart';
import 'package:swift_mart/features/payment/presentation/views/widgets/payment_methids_list.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          sliver: SliverAppBar(
            leading: GestureDetector(
              onTap: () => context.pop(),
              child: const Icon(Icons.arrow_back_ios_new),
            ),
            centerTitle: true,
            title: Text(
              'Checkout',
              style: AppStyles.styleSemiBold27(context),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .03,
                ),
                Text(
                  'Choose a Payment',
                  style: AppStyles.styleRegular28(context),
                ),
                Text(
                  'Method',
                  style: AppStyles.styleSemiBold27(context),
                ),
                SizedBox(
                  height: 26,
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: PaymentMethodsLists(),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(
            left: 8.0,
            top: 34,
          ),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivery Address',
                  style: AppStyles.styleSemiBold18(context),
                ),
                SizedBox(
                  height: 26,
                ),
                SizedBox(
                  height: 95,
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            Assets.imagesBlendMap,
                          ),
                          Positioned(
                            top: 0,
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Container(
                                padding: EdgeInsets.all(9),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    100,
                                  ),
                                ),
                                child: Icon(
                                  IconlyLight.location,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      BlocBuilder<FetchUserDataCubit, FetchUserDataState>(
                        builder: (context, state) {
                          if (state is FetchUserDataSuccess) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Home Address',
                                  style: AppStyles.styleSemiBold18(context),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  state.userModel.address,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyles.styleGreyReg13(context),
                                ),
                              ],
                            );
                          } else {
                            return SliverToBoxAdapter(
                              child: Text('data'),
                            );
                          }
                        },
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      InkWell(
                        onTap: () => GoRouter.of(context).push(
                          RouterPath.kEditProfileView,
                        ),
                        child: Icon(
                          IconlyLight.edit,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        OrderFinanceDetailsSection(),
        MultiBlocListener(
          listeners: [
            BlocListener<CheckAvailableQuantityCubit,
                CheckAvailableQuantityState>(
              listener: (context, state) {
                if (state is CheckAvailableQuantityLoading) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) =>
                        CustomLoadingIndicator(inAsyncCall: true),
                  );
                } else if (state is CheckAvailableQuantityFailed) {
                  Navigator.of(context).pop();
                  showedScaffoldMessage(
                      context: context, message: state.errorMessage);
                } else if (state is CheckAvailableQuantitySuccess) {
                  Navigator.of(context).pop();
                }
              },
            ),
            BlocListener<FethTotalCartPriceCubit, FetchTotalCartPriceState>(
              listener: (context, state) {
                if (state is FetchUserCartSuccess) {}
              },
            ),
            BlocListener<FetchUserCartCubit, FetchUserCartState>(
              listener: (context, state) {},
            ),
          ],
          child: SliverPadding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 8,
            ),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    BlocProvider.of<CheckAvailableQuantityCubit>(context)
                        .checkAvailableQuantityMethod();
                    BlocProvider.of<SubmitOrderCubit>(context)
                        .submitOrderMethod(
                      orderModel: OrderModel(
                        subTotalPrice: subTotalPrice,
                        shippingCost: shippingCost,
                        paymentStatus: paymentStatus,
                        products: products,
                        totalPrice: totalPrice,
                        shippingAddress: shippingAddress,
                        shippingMethod: shippingMethod,
                        orderStatus: 'Pinnding',
                        orderDate: DateTime.now(),
                      ),
                    );
                  },
                  label: Text(
                    'Pay Now',
                    style: AppStyles.styleRegular18(context),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
