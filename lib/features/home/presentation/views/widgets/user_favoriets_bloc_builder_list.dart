import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/core/functions/show_meeage.dart';
import 'package:swift_mart/features/home/presentation/managers/fetch_user_favoriets_cubit/fetch_user_favoriets_cubit.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/favoriest_item.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/favoriets_loading_indicatorl_list.dart';

class UserFavorietsBlocBuilderList extends StatelessWidget {
  const UserFavorietsBlocBuilderList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchUserFavorietsCubit, FetchUserFavorietsState>(
      builder: (context, state) {
        if (state is FetchUserFavorietsSuccess) {
          return SliverGrid.builder(
            itemCount: state.products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 240,
            ),
            itemBuilder: (context, index) => FavoritesItem(
              productModel: state.products.reversed.toList()[index],
            ),
          );
        } else {
          return const FavloritesLoadingIndicatorList();
        }
      },
      listener: (context, state) {
        if (state is FetchUserFavorietsFailed) {
          showedScaffoldMessage(context: context, message: state.errorMessage);
        }
      },
    );
  }
}
