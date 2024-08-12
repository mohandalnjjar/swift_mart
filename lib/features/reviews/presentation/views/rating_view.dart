import 'package:flutter/material.dart';
import 'package:swift_mart/features/reviews/data/models/review_view_data_model.dart';
import 'package:swift_mart/features/reviews/presentation/views/widgets/rating_view_body.dart';

class RattingView extends StatelessWidget {
  const RattingView({super.key, required this.reviewViewDataModel});
  final ReviewViewDataModel reviewViewDataModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RatingViewBody(
          reviewViewDataModel: reviewViewDataModel,
        ),
      ),
    );
  }
}
