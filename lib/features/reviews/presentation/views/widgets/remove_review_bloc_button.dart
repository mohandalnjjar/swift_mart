import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/features/reviews/data/models/review_model.dart';
import 'package:swift_mart/features/reviews/data/repos/review_repo_impl.dart';
import 'package:swift_mart/features/reviews/presentation/managers/remove_user_review_cubit/remove_user_review_cubit.dart';
import 'package:swift_mart/features/reviews/presentation/views/widgets/remove_review_dialog.dart';

class RemoveReviewBlocButton extends StatelessWidget {
  const RemoveReviewBlocButton({
    super.key,
    required this.reviewModel,
    required this.productId,
  });

  final ReviewModel reviewModel;
  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RemoveUserReviewCubit(
        reviewRepoImpl: ReviewRepoImpl(),
      ),
      child: RemoveReviewDialog(
        reviewModel: reviewModel,
        productId: productId,
      ),
    );
  }
}
