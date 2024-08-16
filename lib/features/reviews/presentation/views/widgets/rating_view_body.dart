import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swift_mart/core/functions/show_meeage.dart';
import 'package:swift_mart/core/utils/services/app_text_styles.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/cart_loading_list.dart';
import 'package:swift_mart/features/reviews/data/models/review_view_data_model.dart';
import 'package:swift_mart/features/reviews/presentation/managers/fetch_reviews_cubit/fetch_reviews_cubit.dart';
import 'package:swift_mart/features/reviews/presentation/views/widgets/add_review_bloc_button.dart';
import 'package:swift_mart/features/reviews/presentation/views/widgets/comment_widget.dart';
import 'package:swift_mart/features/reviews/presentation/views/widgets/current_user_comment_widget.dart';
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
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 13),
          sliver: SliverToBoxAdapter(
            child: RattingIndicatorsWidget(),
          ),
        ),
        BlocConsumer<FetchReviewsCubit, FetchReviewsState>(
          listener: (context, state) {
            if (state is FetchReviewsFailed) {
              showedScaffoldMessage(
                  context: context, message: state.errorMessage);
            }
          },
          builder: (context, state) {
            final auth = FirebaseAuth.instance;
            User? user = auth.currentUser;
            if (state is FetchReviewsSuccess) {
              return SliverList.builder(
                itemCount: state.reviews.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 8,
                  ),
                  child: index == 0 && state.reviews[index].userId == user!.uid
                      ? CurrentUserCommentWidget(
                          reviewModel: state.reviews[index],
                          productId: reviewViewDataModel.productId,
                        )
                      : CommentWidget(
                          reviewModel: state.reviews[index],
                        ),
                ),
              );
            } else {
              return const CartLoadingList();
            }
          },
        ),
      ],
    );
  }
}
