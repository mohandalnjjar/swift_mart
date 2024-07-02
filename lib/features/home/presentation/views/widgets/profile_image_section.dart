import 'package:flutter/material.dart';
import 'package:swift_mart/core/utils/const/app_images.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';

class ProfileImageSection extends StatelessWidget {
  const ProfileImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.25,
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(Assets.imagesMuhanedtwo),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Muhaned Alnjjar',
            style: AppStyles.styleRegular24(context),
          ),
          const SizedBox(height: 7),
          Text(
            'moahnedalnjjar23@gmail.com',
            style: AppStyles.styleGreyReg16(context),
          )
        ],
      ),
    );
  }
}
