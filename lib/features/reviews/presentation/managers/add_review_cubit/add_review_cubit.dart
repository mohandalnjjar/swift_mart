import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swift_mart/features/reviews/data/models/review_model.dart';
import 'package:swift_mart/features/reviews/data/repos/review_repo_impl.dart';

part 'add_review_state.dart';

class AddReviewCubit extends Cubit<AddReviewCubitState> {
  AddReviewCubit({required this.reviewRepoImpl}) : super(AddReviewInitial());

  final ReviewRepoImpl reviewRepoImpl;

  Future<void> addReviewMethod(
      {required ReviewModel revieModel, required String productId}) async {
    emit(
      AddReviewLoading(),
    );

    var result = await reviewRepoImpl.addRatting(
        revieModel: revieModel, productId: productId);

    result.fold(
      (failed) {
        emit(
          AddReviewFailed(errorMeassage: failed.errorMessage),
        );
      },
      (success) {
        emit(
          AddReviewSuccess(),
        );
      },
    );
  }
}
