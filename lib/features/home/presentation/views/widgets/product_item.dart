import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/home/data/models/product_model.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => GoRouter.of(context).push(
          RouterPath.kDetailsView,
          extra: productModel,
        ),
        child: AspectRatio(
          aspectRatio: 2 / 3.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: AppColors.kWhitePrimaryColor,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: productModel.images[0],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                productModel.title,
                maxLines: 1,
                style: AppStyles.styleRegular19(context),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    productModel.price,
                    style: AppStyles.style700w16(context),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Ionicons.heart_outline,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
