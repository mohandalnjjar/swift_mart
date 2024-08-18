import 'package:flutter/material.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/flash_sale_item.dart';

class FlashSaleList extends StatelessWidget {
  const FlashSaleList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .28,
      child: PageView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return const FlashSaleItem();
        },
      ),
    );
  }
}
