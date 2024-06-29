import 'package:flutter/material.dart';
import 'package:swift_mart/features/home/presentation/views/details_view_buttom_sheet.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: DetailsViewBody(),
      ),
      bottomNavigationBar: DetailsButtomSheetWidget(),
    );
  }
}
