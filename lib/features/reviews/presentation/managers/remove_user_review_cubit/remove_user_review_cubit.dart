import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swift_mart/features/reviews/data/models/review_model.dart';
import 'package:swift_mart/features/reviews/data/repos/review_repo_impl.dart';

part 'remove_user_review_state.dart';

class RemoveUserReviewCubit extends Cubit<RemoveUserReviewState> {
  RemoveUserReviewCubit({required this.reviewRepoImpl})
      : super(RemoveUserReviewInitial());

  final ReviewRepoImpl reviewRepoImpl;

  Future<void> removeReviewMethod(
      {required ReviewModel revieModel, required String productId}) async {
    emit(
      RemoveUserReviewLoading(),
    );

    var result = await reviewRepoImpl.removeUserReview(
        revieModel: revieModel, productId: productId);

    result.fold(
      (failed) {
        emit(
          RemoveUserReviewFailed(errorMessage: failed.errorMessage),
        );
      },
      (success) {
        emit(
          RemoveUserReviewSuccess(),
        );
      },
    );
  }
}
