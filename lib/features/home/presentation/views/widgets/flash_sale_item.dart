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
      child: AspectRatio(
        aspectRatio: 1.9,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl:
                  'https://img.freepik.com/free-vector/modern-black-friday-sale-banner-template-with-3d-background-red-splash_1361-1877.jpg?t=st=1719317070~exp=1719320670~hmac=b59cb9968db4b64bfc08239bfa589a39688bcd406999b26431d24ec55fe0be91&w=1380',
              placeholder: (context, url) => const ShimmerEffect(),
              errorWidget: (context, url, error) => Container(
                color: Colors.amber,
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
