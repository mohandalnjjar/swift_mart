import 'package:flutter/material.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/categoryListView.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CategoryListView()
    );
  }
}
