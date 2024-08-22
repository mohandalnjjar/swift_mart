import 'package:flutter/material.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/core/utils/const/app_images.dart';
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
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color:
            isActive ? AppColors.kPrimaryColor : AppColors.kWhitePrimaryColor,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 7,
              top: 5,
              bottom: 5,
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                Assets.imagesTshirt,
              ),
            ),
          ),
          SizedBox(
            width: 6,
          ),
          Text(
            categoryItemModel.title,
            style: isActive
                ? AppStyles.styleRegular15(context).copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )
                : AppStyles.styleRegular15(context),
          ),
          SizedBox(
            width: 18,
          ),
        ],
      ),
    );
  }
}
