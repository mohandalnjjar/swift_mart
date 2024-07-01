import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/widgets/shimmer_effect.dart';

class FlashSaleItem extends StatelessWidget {
  const FlashSaleItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await GoRouter.of(context).push(RouterPath.kDetailsView);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 7,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl:
                'https://mir-s3-cdn-cf.behance.net/project_modules/fs/dee186153544611.6331e2e89d314.jpg',
            placeholder: (context, url) => const ShimmerEffect(),
            errorWidget: (context, url, error) => Container(
              color: Colors.amber,
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
