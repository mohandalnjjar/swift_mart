import 'package:flutter/material.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    required this.widget,
    this.onpressed,
    this.iconSize = 24,
  });
  final String title;
  final Widget widget;
  final double iconSize;

  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget,
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Text(
              title,
              style: AppStyles.styleSemiBold24(context),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
