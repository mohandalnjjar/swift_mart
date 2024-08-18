import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';

class FavorietsLoadingIndicator extends StatelessWidget {
  const FavorietsLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.kWhitePrimaryColor,
      highlightColor: AppColors.kPrimaryColor,
      child: Stack(
        children: [
          const Positioned(
            right: 10,
            top: 7,
            child: Icon(
              Ionicons.heart_outline,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ThemeData().dialogBackgroundColor.withOpacity(0.3),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 8,
            right: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: ThemeData().dialogBackgroundColor.withOpacity(0.3),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 14,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ThemeData().dialogBackgroundColor.withOpacity(0.3),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
