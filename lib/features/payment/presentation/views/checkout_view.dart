import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/features/home/data/repos/home_repo_impl.dart';
import 'package:swift_mart/features/home/presentation/managers/check_available_quantitycubit/check_available_quantity_cubit.dart';
import 'package:swift_mart/features/home/presentation/managers/fetch_cart_total_price_cubit/fetch_total_cart_price_cubit.dart';
import 'package:swift_mart/features/home/presentation/managers/submit_order_cubit/submit_order_cubit_cubit.dart';
import 'package:swift_mart/features/payment/data/repos/check_out_repo_impl.dart';
import 'package:swift_mart/features/payment/presentation/managers/payment_cubit/payment_cubit.dart';
import 'package:swift_mart/features/payment/presentation/views/widgets/check_out_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FethTotalCartPriceCubit(
            HomeRepoImpl(),
          )..fetchTotalPriceMethod(),
        ),
        BlocProvider(
          create: (context) => CheckAvailableQuantityCubit(
            HomeRepoImpl(),
          ),
        ),
        BlocProvider(
          create: (context) => SubmitOrderCubit(
            HomeRepoImpl(),
          ),
        ),
        BlocProvider(
          create: (context) => PaymentCubit(
            CheckOutRepoImpl(),
          ),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: CheckoutViewBody(),
        ),
      ),
    );
  }
}
