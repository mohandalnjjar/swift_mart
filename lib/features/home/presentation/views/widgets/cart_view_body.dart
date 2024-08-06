import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/functions/is_arabic.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/home/presentation/managers/fetch_user_cart_cubit/fetch_user_cart_cubit.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/user_cart_list_bloc_builder.dart';
import 'package:swift_mart/generated/l10n.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          sliver: SliverAppBar(
            leading: GestureDetector(
              onTap: () => context.pop(),
              child: const Icon(Icons.arrow_back_ios_new),
            ),
            centerTitle: true,
            title: Text(
              S.of(context).Cart,
              style: AppStyles.styleSemiBold30(context),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              S.of(context).YourCart,
              style: AppStyles.styleRegular40(context),
            ),
          ),
        ),
        BlocBuilder<FetchUserCartCubit, FetchUserCartState>(
          builder: (context, state) {
            return SliverPadding(
              padding: EdgeInsets.only(
                left: isArabic() ? 0 : 8.0,
                right: isArabic() ? 8.0 : 0,
                bottom: 10,
              ),
              sliver: SliverToBoxAdapter(
                child: Text(
                  S.of(context).List(state is FetchUserCartSuccess
                      ? state.products.length.toString()
                      : '0'),
                  style: AppStyles.styleRegular30(context),
                ),
              ),
            );
          },
        ),
        const UserCartBlocBuilderList(),
      ],
    );
  }
}
