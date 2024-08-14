import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_mart/features/reviews/data/models/review_view_data_model.dart';
import 'package:swift_mart/features/reviews/presentation/managers/fetch_reviews_cubit/fetch_reviews_cubit.dart';
import 'package:swift_mart/features/reviews/presentation/views/widgets/rating_view_body.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({super.key, required this.reviewViewDataModel});
  final ReviewViewDataModel reviewViewDataModel;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchReviewsCubit()
            ..fetchReviews(
              productId: reviewViewDataModel.productId,
            ),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: RviewsViewBody(
            reviewViewDataModel: reviewViewDataModel,
          ),
        ),
      ),
    );
  }
}
