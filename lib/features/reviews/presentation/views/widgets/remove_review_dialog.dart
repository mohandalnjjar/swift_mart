import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/features/reviews/data/models/review_model.dart';
import 'package:swift_mart/features/reviews/presentation/managers/fetch_reviews_average_cubit/fetch_reviews_average_cubit.dart';
import 'package:swift_mart/features/reviews/presentation/managers/remove_user_review_cubit/remove_user_review_cubit.dart';

class RemoveReviewDialog extends StatelessWidget {
  const RemoveReviewDialog({
    super.key,
    required this.reviewModel,
    required this.productId,
  });
  final ReviewModel reviewModel;
  final String productId;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
      title: const Text('Remove Review'),
      content: const Text('Are you sure you want to remove your review?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            try {
              BlocProvider.of<RemoveUserReviewCubit>(context)
                  .removeReviewMethod(
                      revieModel: reviewModel, productId: productId);
            } finally {
              BlocProvider.of<FetchReviewsAverageCubit>(context)
                  .fetchAverageReviewMethod(productId: productId);
            }
            Navigator.of(context).pop();
          },
          child: const Text('Remove'),
        ),
      ],
    );
  }
}
