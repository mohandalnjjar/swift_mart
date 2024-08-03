import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/home/data/models/product_model.dart';
import 'package:swift_mart/features/home/presentation/managers/remove_favoriets_cubit/remove_favorites_cubit.dart';

class FavoritesItem extends StatelessWidget {
  const FavoritesItem({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context)
          .push(RouterPath.kDetailsView, extra: productModel),
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: AppColors.kWhitePrimaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  height: 140,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  imageUrl: productModel.images[0],
                ),
                Positioned(
                  right: 4,
                  child: InkWell(
                    onTap: () {
                      BlocProvider.of<RemoveFavoritesCubit>(context)
                          .removeFavoritesMethod(productModel: productModel);
                    },
                    child: const Icon(
                      Ionicons.heart,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              productModel.title,
              style: AppStyles.styleRegular18(context),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              '\$ ${productModel.price}',
              style: AppStyles.style700w16(context),
            ),
          ],
        ),
      ),
    );
  }
}
