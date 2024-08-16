import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swift_mart/features/reviews/data/models/star_rating_counts_model.dart';
import 'package:swift_mart/features/reviews/data/repos/review_repo_impl.dart';

part 'rating_indicator_state.dart';

class RatingIndicatorCubit extends Cubit<RatingIndicatorState> {
  RatingIndicatorCubit({required this.reviewRepoImpl})
      : super(RatingIndicatorInitial());

  final ReviewRepoImpl reviewRepoImpl;

  Future<void> starRatingCountsMethod({required String productId}) async {
    emit(
      RatingIndicatorLoading(),
    );
    reviewRepoImpl.countProductStars(productId: productId).listen(
      (response) {
        response.fold((failed) {
          emit(RatingIndicatorFailed(errorMessage: failed.errorMessage));
        }, (success) {
          emit(
            RatingIndicatorSuccess(starRatingCounts: success),
          );
        });
      },
    );
  }
}
