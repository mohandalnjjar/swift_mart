import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:swift_mart/core/functions/show_meeage.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/const/app_images.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/core/utils/widgets/custom_loading_indicator.dart';
import 'package:swift_mart/features/home/data/models/order_finance_details.dart';
import 'package:swift_mart/features/home/data/models/order_model.dart';
import 'package:swift_mart/features/home/data/models/product_model.dart';
import 'package:swift_mart/features/home/data/models/user_model.dart';
import 'package:swift_mart/features/home/presentation/managers/check_available_quantitycubit/check_available_quantity_cubit.dart';
import 'package:swift_mart/features/home/presentation/managers/fetch_cart_total_price_cubit/fetch_total_cart_price_cubit.dart';
import 'package:swift_mart/features/home/presentation/managers/fetch_user_cart_cubit/fetch_user_cart_cubit.dart';
import 'package:swift_mart/features/home/presentation/managers/fetch_user_data_cubit/fetch_user_data_cubit.dart';
import 'package:swift_mart/features/home/presentation/managers/submit_order_cubit/submit_order_cubit_cubit.dart';
import 'package:swift_mart/features/payment/data/models/payment_models/payment_intent_input_model.dart';
import 'package:swift_mart/features/payment/presentation/managers/payment_cubit/payment_cubit.dart';
import 'package:swift_mart/features/payment/presentation/views/widgets/order_details_finance_section.dart';
import 'package:swift_mart/features/payment/presentation/views/widgets/payment_methids_list.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({
    super.key,
  });

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  @override
  void initState() {
    super.initState();

    context.read<FetchUserCartCubit>().fetchUserCartMethod();
    context.read<FethTotalCartPriceCubit>().fetchTotalPriceMethod();
    context.read<FetchUserDataCubit>().fetchUserDataMethod();
  }

  @override
  Widget build(BuildContext context) {
    OrderFinanceDetails? financeDetails;
    List<ProductModel>? products;
    UserModel? usermodel;

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
            BlocListener<FetchUserCartCubit, FetchUserCartState>(
              listener: (context, state) {
                if (state is FetchUserCartSuccess) {
                  products = state.products; // Store fetched products
                } else if (state is FetchUserCartFailure) {
                  showedScaffoldMessage(
                    context: context,
                    message: state.errorMessage,
                  );
                }
              },
            ),
            BlocListener<FethTotalCartPriceCubit, FetchTotalCartPriceState>(
              listener: (context, state) {
                if (state is FethTotalCartPriceSuccess) {
                  financeDetails =
                      state.orderFinanceDetails; // Store finance details
                } else if (state is FethTotalCartPriceFailed) {
                  showedScaffoldMessage(
                    context: context,
                    message: state.errorMessage,
                  );
                }
              },
            ),
            BlocListener<FetchUserDataCubit, FetchUserDataState>(
              listener: (context, state) {
                if (state is FetchUserDataSuccess) {
                  usermodel = state.userModel; // Store finance details
                } else if (state is FetchUserDataFailed) {
                  showedScaffoldMessage(
                    context: context,
                    message: state.errorMessage,
                  );
                }
              },
            ),
            BlocListener<SubmitOrderCubit, SubmitOrderCubitState>(
              listener: (context, state) {
                if (state is SubmitOrderCubitLoading) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) =>
                        CustomLoadingIndicator(inAsyncCall: true),
                  );
                } else if (state is SubmitOrderCubitSuccess) {
                  Navigator.of(context).pop();
                  showedScaffoldMessage(
                    context: context,
                    message: 'Success',
                  );
                } else if (state is SubmitOrderCubitFailed) {
                  showedScaffoldMessage(
                    context: context,
                    message: state.errorMessage,
                  );
                }
              },
            ),
            BlocListener<PaymentCubit, PaymentState>(
              listener: (context, state) {
                if (state is PaymentSuccess) {
                  Navigator.pop(context);
                } else if (state is PaymentFailure) {
                  showedScaffoldMessage(
                    context: context,
                    message: state.faiulreMessage,
                  );
                }
              },
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

                    if (products != null &&
                        financeDetails != null &&
                        usermodel != null) {
                      BlocProvider.of<SubmitOrderCubit>(context)
                          .submitOrderMethod(
                        orderModel: OrderModel(
                          subTotalPrice: financeDetails!.supTotalPrice,
                          shippingCost: financeDetails!.totalShippingCoast,
                          paymentStatus: 'Pending',
                          products: products!,
                          totalPrice: financeDetails!.totalPrice,
                          shippingAddress: usermodel!.address,
                          shippingMethod: 'Standard Shipping',
                          orderStatus: 'Pending',
                          orderDate: DateTime.now(),
                        ),
                      );
                    }

                    BlocProvider.of<PaymentCubit>(context).makePaymentMethod(
                      paymentIntentInputModel: PaymentIntentInputModel(
                        amount: financeDetails!.totalPrice.toString(),
                        currency: "EGP",
                        customerId: usermodel!.stripeId,
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
