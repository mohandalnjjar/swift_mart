import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';

class DetailedListSelectedImage extends StatelessWidget {
  const DetailedListSelectedImage(
      {super.key, required this.isActive, required this.image});
  final bool isActive;
  final String image;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Container(
        margin: const EdgeInsets.only(
          right: 8,
          top: 8,
          bottom: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: AppColors.kWhitePrimaryColor,
          border: isActive
              ? Border.all(
                  color: AppColors.kPrimaryColor,
                  width: 2.0,
                )
              : null,
        ),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
