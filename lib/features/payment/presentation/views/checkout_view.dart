import 'package:flutter/material.dart';
import 'package:swift_mart/features/payment/presentation/views/widgets/chcekout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CheckoutViewBody(),
      ),
    );
  }
}
