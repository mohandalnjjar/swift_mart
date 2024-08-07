import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/reviews/presentation/views/widgets/custom_ratting_bar.dart';
import 'package:swift_mart/features/reviews/presentation/views/widgets/ratting_indicator.dart';

class RatingViewBody extends StatelessWidget {
  const RatingViewBody({
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
              'Rattings',
              style: AppStyles.styleSemiBold30(context),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        '2.5',
                        style: AppStyles.styleRegular60(context),
                      ),
                    ),
                    const Expanded(
                      flex: 7,
                      child: Column(
                        children: [
                          RattingIndicator(
                            stars: '5',
                            value: 0.9,
                          ),
                          RattingIndicator(
                            stars: '4',
                            value: 0.4,
                          ),
                          RattingIndicator(
                            stars: '3',
                            value: 0.3,
                          ),
                          RattingIndicator(
                            stars: '2',
                            value: 0.2,
                          ),
                          RattingIndicator(
                            stars: '1',
                            value: 0.1,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const RatingBar(
                  rating: 2.9,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '12,230',
                  style: AppStyles.styleGreyReg16(context),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
