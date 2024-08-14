import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swift_mart/features/reviews/data/repos/review_repo_impl.dart';

part 'check_user_review_state.dart';

class CheckUserReviewCubit extends Cubit<CheckUserReviewState> {
  CheckUserReviewCubit({required this.reviewRepoImpl})
      : super(CheckUserReviewInitial());
  final ReviewRepoImpl reviewRepoImpl;
  Future<void> checkUserReview({
    required String userId,
    required String productId,
  }) async {
    emit(
      CheckUserReviewLoading(),
    );

    var response = await reviewRepoImpl.checkUserReview(
        productId: productId, userId: userId);

    response.fold(
      (failed) {
        emit(
          CheckUserReviewFailed(errorMessage: failed.errorMessage),
        );
      },
      (success) {
        emit(
          CheckUserReviewSuccess(
            isReviewed: success,
          ),
        );
      },
    );
  }
}
