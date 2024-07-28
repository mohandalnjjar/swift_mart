import 'package:flutter/material.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';

class DetailsVewiNumsListItem extends StatelessWidget {
  const DetailsVewiNumsListItem({
    super.key,
    required this.isActive,
    required this.sizeValue,
  });

  final bool isActive;
  final String sizeValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 8,
        top: 8,
        bottom: 8,
      ),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: isActive ? AppColors.kPrimaryColor : Colors.transparent,
        border: Border.all(
          color: isActive ? Colors.transparent : Colors.grey,
        ),
      ),
      child: Center(
        child: Text(
          sizeValue,
          style: AppStyles.styleRegular22(context),
        ),
      ),
    );
  }
}
