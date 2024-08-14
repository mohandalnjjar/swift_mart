import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:swift_mart/core/utils/const/app_constance.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/custom_cart_button.dart';
import 'package:swift_mart/features/reviews/data/models/review_view_data_model.dart';
import 'package:swift_mart/features/reviews/data/repos/review_repo_impl.dart';
import 'package:swift_mart/features/reviews/presentation/managers/check_user_review_cubit/check_user_review_cubit.dart';

class AddReviewBlocButton extends StatelessWidget {
  const AddReviewBlocButton({
    super.key,
    required this.reviewViewDataModel,
  });

  final ReviewViewDataModel reviewViewDataModel;

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    return BlocProvider(
      create: (context) => CheckUserReviewCubit(
        reviewRepoImpl: ReviewRepoImpl(),
      ),
      child: BlocBuilder<CheckUserReviewCubit, CheckUserReviewState>(
        builder: (context, state) {
          context.read<CheckUserReviewCubit>().checkUserReview(
              userId: user!.uid, productId: reviewViewDataModel.productId);
          if (state is CheckUserReviewSuccess) {
            if (state.isReviewed) {
              return const SizedBox();
            } else {
              return CustomButton(
                icon: const Icon(
                  Ionicons.add,
                  color: Colors.white,
                ),
                onTap: () => GoRouter.of(context).push(
                  RouterPath.kAddRattingReview,
                  extra: ReviewViewDataModel(
                    image: reviewViewDataModel.image,
                    productId: reviewViewDataModel.productId,
                  ),
                ),
              );
            }
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
