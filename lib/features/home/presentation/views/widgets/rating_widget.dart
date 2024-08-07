import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(RouterPath.kRattingView);
      },
      child: Row(
        children: [
          const Icon(
            Ionicons.star,
            color: Colors.amber,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            '3.4',
            style: AppStyles.style700w16(context).copyWith(
              color: Colors.grey.shade600,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
