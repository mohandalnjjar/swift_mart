import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swift_mart/features/home/data/models/product_model.dart';
import 'package:swift_mart/features/home/presentation/managers/add_favoriets_cubit/add_favorites_cubit.dart';
import 'package:swift_mart/features/home/presentation/managers/fetch_user_favoriets_cubit/fetch_user_favoriets_cubit.dart';
import 'package:swift_mart/features/home/presentation/managers/remove_favoriets_cubit/remove_favorites_cubit.dart';

class AddRemoveToFavorietsButton extends StatelessWidget {
  const AddRemoveToFavorietsButton({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchUserFavorietsCubit, FetchUserFavorietsState>(
      builder: (context, state) {
        final isFavorite = state is FetchUserFavorietsSuccess &&
            state.products.any((product) => product.id == productModel.id);
        return InkWell(
          onTap: () {
            if (isFavorite) {
              BlocProvider.of<RemoveFavoritesCubit>(context)
                  .removeFavoritesMethod(productModel: productModel);
            } else {
              BlocProvider.of<AddFavoritesCubit>(context)
                  .addFavoritesMethod(productModel: productModel);
            }
          },
          child: Icon(
            isFavorite ? Ionicons.heart : Ionicons.heart_outline,
            color: isFavorite ? Colors.red : null,
          ),
        );
      },
    );
  }
}
