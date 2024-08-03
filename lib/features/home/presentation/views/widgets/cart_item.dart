import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:swift_mart/core/utils/const/app_colors.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/home/data/models/product_model.dart';
import 'package:swift_mart/features/home/presentation/managers/remove_from_cubit/remove_from_cart_cubit.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context)
                .push(RouterPath.kDetailsView, extra: productModel);
          },
          child: AspectRatio(
            aspectRatio: 3 / 4,
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
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * .4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                productModel.title,
                style: AppStyles.styleRegular21(context),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                '\$ ${productModel.price}',
                style: AppStyles.styleSemiBold21(context),
              ),
              const SizedBox(
                height: 7,
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.add_circle_rounded,
                        color: AppColors.kPrimaryColor,
                        size: 27,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '22',
                      style: AppStyles.styleRegular18(context),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.remove_circle_outline,
                        color: AppColors.kPrimaryColor,
                        size: 27,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Spacer(
          flex: 3,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  BlocProvider.of<RemoveFromCartCubit>(context)
                      .removeToCartMethod(productModel: productModel);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.red,
                  ),
                  child: const Icon(
                    IconlyLight.delete,
                    color: Colors.white,
                    size: 23,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
