import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';

class ProductLoadingShimmerIndicatorItem extends StatelessWidget {
  const ProductLoadingShimmerIndicatorItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.kWhitePrimaryColor,
      highlightColor: AppColors.kPrimaryColor,
      child: AspectRatio(
        aspectRatio: 2 / 3.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ThemeData().dialogBackgroundColor.withOpacity(0.3),
                ),
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            FractionallySizedBox(
              widthFactor: 0.6,
              child: Container(
                height: 17,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ThemeData().dialogBackgroundColor.withOpacity(0.3),
                ),
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            FractionallySizedBox(
              widthFactor: 0.9,
              child: Container(
                height: 17,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ThemeData().dialogBackgroundColor.withOpacity(0.3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
