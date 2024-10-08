import 'package:flutter/material.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/home/data/models/category_model.dart';

class LastSeenListItem extends StatelessWidget {
  const LastSeenListItem({super.key, required this.categoryItmeModel});

  final LanguageCategoryItemModel categoryItmeModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 76,
          width: 76,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.kWhitePrimaryColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Image.asset(
            categoryItmeModel.image,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Flexible(
          child: Text(
            categoryItmeModel.title,
            style: AppStyles.style700w14(context),
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
