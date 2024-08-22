import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  const DottedLine({
    super.key,
    required this.itemCount,
  });
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          color: Colors.grey.shade400,
          width: 7,
        ),
      ),
    );
  }
}
