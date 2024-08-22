import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/ordders_item.dart';
import 'package:swift_mart/generated/l10n.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        //Search Appbar
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          sliver: SliverAppBar(
            leading: GestureDetector(
              onTap: () => context.pop(),
              child: const Icon(Icons.arrow_back_ios_new),
            ),
            centerTitle: true,
            title: Text(
              S.of(context).OrdersSummary,
              style: AppStyles.styleSemiBold27(context),
            ),
          ),
        ),
        SliverList.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return const OrdersViewItem();
          },
        )
      ],
    );
  }
}
