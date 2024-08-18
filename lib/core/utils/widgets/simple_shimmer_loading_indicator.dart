import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';

class SimpleShimmerLoadingIndicator extends StatelessWidget {
  const SimpleShimmerLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.kWhitePrimaryColor,
      highlightColor: AppColors.kPrimaryColor,
      child: Container(
        color: ThemeData().dialogBackgroundColor.withOpacity(0.3),
      ),
    );
  }
}
