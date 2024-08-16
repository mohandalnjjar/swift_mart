import 'package:flutter/material.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';

class RattingIndicator extends StatelessWidget {
  const RattingIndicator({
    super.key,
    required this.stars,
    required this.value,
  });
  final String stars;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          stars,
          style: AppStyles.styleRegular20(context),
        ),
        const SizedBox(
          width: 6,
        ),
        Expanded(
          child: LinearProgressIndicator(
            minHeight: 11,
            value: value,
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ],
    );
  }
}
