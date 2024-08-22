import 'package:flutter/material.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';

class CreditCardWodget extends StatelessWidget {
  const CreditCardWodget(
      {super.key, required this.isActive, required this.image});
  final bool isActive;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: AspectRatio(
        aspectRatio: 3 / 2.2,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.kWhitePrimaryColor,
            borderRadius: BorderRadius.circular(26),
            border: isActive
                ? Border.all(
                    color: AppColors.kPrimaryColor,
                    width: 2.0,
                  )
                : null,
          ),
          child: Image.asset(
            image,
            width: 1,
            height: 1,
          ),
        ),
      ),
    );
  }
}
