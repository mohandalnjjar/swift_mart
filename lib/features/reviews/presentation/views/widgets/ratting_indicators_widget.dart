import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/reviews/presentation/managers/fetch_reviews_average_cubit/fetch_reviews_average_cubit.dart';
import 'package:swift_mart/features/reviews/presentation/managers/fetch_reviews_cubit/fetch_reviews_cubit.dart';
import 'package:swift_mart/features/reviews/presentation/views/widgets/fetch_Average_start_system.dart';
import 'package:swift_mart/features/reviews/presentation/views/widgets/rating_indicator_bloc_builder.dart';

class RattingIndicatorsWidget extends StatelessWidget {
  const RattingIndicatorsWidget({
    super.key,
    required this.productId,
  });
  final String productId;
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
                  flex: 4,
                  child: BlocBuilder<FetchReviewsAverageCubit,
                      FetchReviewsAverageState>(
                    builder: (context, state) {
                      return Text(
                        state is FetchReviewsAverageSuccess
                            ? state.average.toString()
                            : '0.0',
                        style: AppStyles.styleRegular60(context),
                      );
                    },
                  ),
                ),
                RatingIndicatorBlocBuilder(productId: productId),
              ],
            ),
            const AverageStarSystemBlocCubit(),
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
