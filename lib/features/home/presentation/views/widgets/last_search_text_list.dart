import 'package:flutter/material.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';

class LastSearchTextList extends StatelessWidget {
  const LastSearchTextList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 5,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(
          bottom: 10.0,
        ),
        child: Text(
          'Under Armour Shoes',
          style: AppStyles.styleGreyReg17(context),
        ),
      ),
    );
  }
}
