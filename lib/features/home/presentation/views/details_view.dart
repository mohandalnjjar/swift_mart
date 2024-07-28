import 'package:flutter/material.dart';
import 'package:swift_mart/features/home/data/models/product_model.dart';
import 'package:swift_mart/features/home/presentation/views/details_view_buttom_sheet.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DetailsViewBody(
          productModel: productModel,
        ),
      ),
      bottomNavigationBar: const DetailsButtomSheetWidget(),
    );
  }
}
