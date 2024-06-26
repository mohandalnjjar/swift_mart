import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/flash_sale_item.dart';

class FlashSaleList extends StatelessWidget {
  const FlashSaleList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CarouselSlider.builder(
        itemCount: 10,
        itemBuilder: (context, index, realIndex) => const FlashSaleItem(),
        options: CarouselOptions(
          viewportFraction: 1,
        ),
      ),
    );
  }
}
