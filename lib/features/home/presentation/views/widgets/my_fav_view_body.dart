import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swift_mart/core/functions/is_arabic.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/home/presentation/managers/fetch_user_favoriets_cubit/fetch_user_favoriets_cubit.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/custom_cart_button.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/user_favoriets_bloc_builder_list.dart';
import 'package:swift_mart/generated/l10n.dart';

class MyFavViewBody extends StatelessWidget {
  const MyFavViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          sliver: SliverAppBar(
            centerTitle: true,
            title: Text(
              S.of(context).favorites,
              style: AppStyles.styleSemiBold27(context),
            ),
            actions: [
              CustomButton(
                icon: const Icon(
                  Ionicons.cart,
                  color: Colors.white,
                ),
                onTap: () => GoRouter.of(context).push(RouterPath.kCartView),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              S.of(context).YourFavorites,
              style: AppStyles.styleRegular40(context),
            ),
          ),
        ),
        BlocBuilder<FetchUserFavorietsCubit, FetchUserFavorietsState>(
          builder: (context, state) {
            if (state is FetchUserFavorietsSuccess) {
              return SliverPadding(
                padding: EdgeInsets.only(
                  left: isArabic() ? 0 : 8.0,
                  right: isArabic() ? 8.0 : 0,
                  bottom: 10,
                ),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    S.of(context).List('${state.products.length}'),
                    style: AppStyles.styleRegular30(context),
                  ),
                ),
              );
            } else if (state is FetchUserFavorietsFailed) {
              return SliverToBoxAdapter(
                child: Text(state.errorMessage),
              );
            } else {
              return const SliverToBoxAdapter(
                child: Text('s'),
              );
            }
          },
        ),
        const UserFavorietsBlocBuilderList(),
      ],
    );
  }
}
