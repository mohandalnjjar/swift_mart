import 'package:flutter/material.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/categoriy_model.dart';

class ActiveCateogryItem extends StatelessWidget {
  const ActiveCateogryItem({
    super.key,
    required this.isActive,
    required this.categoryItemModel,
  });
  final bool isActive;
  final CategoryItemModel categoryItemModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 13,
      ),
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color:
            isActive ? AppColors.kPrimaryColor : Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          categoryItemModel.title,
          style: isActive
              ? AppStyles.styleRegular15(context).copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
              : AppStyles.styleRegular15(context),
        ),
      ),
    );
  }
}
