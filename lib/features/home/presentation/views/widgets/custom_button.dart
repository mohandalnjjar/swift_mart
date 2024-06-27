import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });
  final void Function() onPressed;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(13),
      style: IconButton.styleFrom(
        backgroundColor: Colors.grey.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      icon: icon,
    );
  }
}
