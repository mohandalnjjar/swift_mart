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
      margin: const EdgeInsets.symmetric(
        horizontal: 7,
      ),
      decoration: BoxDecoration(
        color:
            isActive ? AppColors.kPrimaryColor : AppColors.kWhitePrimaryColor,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 3,
            ),
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
        ],
      ),
    );
  }
}
