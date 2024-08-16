import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/features/reviews/data/repos/review_repo_impl.dart';
import 'package:swift_mart/features/reviews/presentation/managers/cubit/rating_indicator_cubit.dart';
import 'package:swift_mart/features/reviews/presentation/views/widgets/ratting_indicator.dart';

class RatingIndicatorBlocBuilder extends StatelessWidget {
  const RatingIndicatorBlocBuilder({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: BlocProvider(
        create: (context) =>
            RatingIndicatorCubit(reviewRepoImpl: ReviewRepoImpl()),
        child: BlocBuilder<RatingIndicatorCubit, RatingIndicatorState>(
          builder: (context, state) {
            if (state is RatingIndicatorInitial) {
              context
                  .read<RatingIndicatorCubit>()
                  .starRatingCountsMethod(productId: productId);
            }

            if (state is RatingIndicatorSuccess) {
              return Column(
                children: [
                  RattingIndicator(
                    stars: '5',
                    value: state.starRatingCounts.fiveStars,
                  ),
                  RattingIndicator(
                    stars: '4',
                    value: state.starRatingCounts.fourStars,
                  ),
                  RattingIndicator(
                    stars: '3',
                    value: state.starRatingCounts.threeStars,
                  ),
                  RattingIndicator(
                    stars: '2',
                    value: state.starRatingCounts.twoStars,
                  ),
                  RattingIndicator(
                    stars: '1',
                    value: state.starRatingCounts.oneStar,
                  ),
                ],
              );
            } else if (state is RatingIndicatorFailed) {
              return Text(state.errorMessage);
            } else {
              return const Text('data');
            }
          },
        ),
      ),
    );
  }
}
