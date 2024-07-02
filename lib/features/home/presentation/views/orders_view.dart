import 'package:flutter/material.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/oreders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: OrdersViewBody(),
      ),
    );
  }
}
