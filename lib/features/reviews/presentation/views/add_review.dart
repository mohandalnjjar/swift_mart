import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/features/reviews/data/models/review_view_data_model.dart';
import 'package:swift_mart/features/reviews/data/repos/review_repo_impl.dart';
import 'package:swift_mart/features/reviews/presentation/managers/add_review_cubit/add_review_cubit.dart';
import 'package:swift_mart/features/reviews/presentation/views/widgets/add_ratting_review_body.dart';

class AddRattingReview extends StatelessWidget {
  const AddRattingReview({
    super.key,
    required this.reviewViewDataModel,
  });
  final ReviewViewDataModel reviewViewDataModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddReviewCubit(
        reviewRepoImpl: ReviewRepoImpl(),
      ),
      child: Scaffold(
        body: SafeArea(
          child: AddRattingReviewBody(
            reviewViewDataModel: reviewViewDataModel,
          ),
        ),
      ),
    );
  }
}
