import 'package:flutter/material.dart';
import 'package:swift_mart/features/reviews/data/models/review_view_data_model.dart';
import 'package:swift_mart/features/reviews/presentation/views/widgets/add_ratting_review_body.dart';

class AddRattingReview extends StatelessWidget {
  const AddRattingReview({
    super.key,
    required this.reviewViewDataModel,
  });
  final ReviewViewDataModel reviewViewDataModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AddRattingReviewBody(
          reviewViewDataModel: reviewViewDataModel,
        ),
      ),
    );
  }
}
