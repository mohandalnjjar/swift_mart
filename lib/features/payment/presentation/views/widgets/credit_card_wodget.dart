import 'package:flutter/material.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';

class CreditCardWodget extends StatelessWidget {
  const CreditCardWodget(
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
          border: isActive
              ? Border.all(
                  color: AppColors.kPrimaryColor,
                  width: 2.0,
                )
              : Border.all(
                  color: Colors.grey.withOpacity(0.4),
                  width: 2.0,
                ),
        ),
        child: Image.asset(image),
      ),
    );
  }
}
