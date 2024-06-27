import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(RouterPath.kSearchView);
        },
        child: Container(
          padding: const EdgeInsets.all(13),
          margin: const EdgeInsets.only(
            left: 8,
            right: 5,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const Icon(IconlyLight.search),
              const SizedBox(
                width: 7,
              ),
              Text(
                'Search',
                style: AppStyles.styleGreyReg16(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
