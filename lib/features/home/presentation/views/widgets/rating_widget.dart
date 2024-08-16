import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/reviews/data/models/review_view_data_model.dart';
import 'package:swift_mart/features/reviews/presentation/managers/fetch_reviews_average_cubit/fetch_reviews_average_cubit.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    required this.reviewViewDataModel,
  });
  final ReviewViewDataModel reviewViewDataModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchReviewsAverageCubit, FetchReviewsAverageState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            GoRouter.of(context)
                .push(RouterPath.kRattingView, extra: reviewViewDataModel);
          },
          child: Row(
            children: [
              const Icon(
                Ionicons.star,
                color: Colors.amber,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                state is FetchReviewsAverageSuccess
                    ? state.average.toString()
                    : '0.0',
                style: AppStyles.style700w16(context).copyWith(
                  color: Colors.grey.shade600,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
