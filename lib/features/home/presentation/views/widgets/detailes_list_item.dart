import 'package:flutter/material.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';

class DetailedListItem extends StatelessWidget {
  const DetailedListItem(
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
          color: AppColors.kWhiteGrey,
          border: isActive
              ? Border.all(
                  color: AppColors.kPrimaryColor,
                  width: 2.0,
                )
              : null,
        ),
        child: Image.asset(image),
      ),
    );
  }
}
