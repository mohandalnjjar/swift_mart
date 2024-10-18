import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/features/home/data/repos/home_repo_impl.dart';
import 'package:swift_mart/features/home/presentation/managers/check_available_quantitycubit/check_available_quantity_cubit.dart';
import 'package:swift_mart/features/home/presentation/managers/fetch_cart_total_price_cubit/fetch_total_cart_price_cubit.dart';
import 'package:swift_mart/features/home/presentation/views/cart_button_sheet_widget.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

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
      ],
      child: const Scaffold(
        body: SafeArea(
          child: CartViewBody(),
        ),
        bottomNavigationBar: CartButtomSheetWidget(),
      ),
    );
  }
}
