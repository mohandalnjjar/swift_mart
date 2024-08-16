import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/reviews/data/models/review_view_data_model.dart';
import 'package:swift_mart/features/reviews/presentation/views/widgets/add_review_bloc_button.dart';
import 'package:swift_mart/features/reviews/presentation/views/widgets/fetch_reviews_bloc_builder.dart';
import 'package:swift_mart/features/reviews/presentation/views/widgets/ratting_indicators_widget.dart';

class RviewsViewBody extends StatelessWidget {
  const RviewsViewBody({
    super.key,
    required this.reviewViewDataModel,
  });
  final ReviewViewDataModel reviewViewDataModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          sliver: SliverAppBar(
            leading: GestureDetector(
              onTap: () => context.pop(),
              child: const Icon(Icons.arrow_back_ios_new),
            ),
            centerTitle: true,
            title: Text(
              'Reviews',
              style: AppStyles.styleSemiBold30(context),
            ),
            actions: [
              AddReviewBlocButton(reviewViewDataModel: reviewViewDataModel),
            ],
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          sliver: SliverToBoxAdapter(
            child: RattingIndicatorsWidget(
              productId: reviewViewDataModel.productId,
            ),
          ),
        ),
        FetchReviewsBlocBuilder(reviewViewDataModel: reviewViewDataModel),
      ],
    );
  }
}
