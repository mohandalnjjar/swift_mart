import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/reviews/presentation/managers/fetch_reviews_cubit/fetch_reviews_cubit.dart';
import 'package:swift_mart/features/reviews/presentation/views/widgets/custom_ratting_bar.dart';
import 'package:swift_mart/features/reviews/presentation/views/widgets/ratting_indicator.dart';

class RattingIndicatorsWidget extends StatelessWidget {
  const RattingIndicatorsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchReviewsCubit, FetchReviewsState>(
      builder: (context, state) {
        return Column(
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
              state is FetchReviewsSuccess
                  ? state.reviews.length.toString()
                  : '0',
              style: AppStyles.styleGreyReg16(context),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }
}
