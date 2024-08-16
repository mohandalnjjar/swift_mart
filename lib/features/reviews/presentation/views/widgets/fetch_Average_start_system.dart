import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/features/reviews/presentation/managers/fetch_reviews_average_cubit/fetch_reviews_average_cubit.dart';
import 'package:swift_mart/features/reviews/presentation/views/widgets/custom_ratting_bar.dart';

class AverageStarSystemBlocCubit extends StatelessWidget {
  const AverageStarSystemBlocCubit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchReviewsAverageCubit, FetchReviewsAverageState>(
      builder: (context, state) {
        return RatingBar(
          rating: state is FetchReviewsAverageSuccess ? state.average : 0.0,
        );
      },
    );
  }
}
