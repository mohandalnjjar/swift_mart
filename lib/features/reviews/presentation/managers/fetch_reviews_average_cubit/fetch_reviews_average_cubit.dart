import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swift_mart/features/reviews/data/repos/review_repo_impl.dart';

part 'fetch_reviews_average_state.dart';

class FetchReviewsAverageCubit extends Cubit<FetchReviewsAverageState> {
  FetchReviewsAverageCubit({required this.reviewRepoImpl})
      : super(FetchReviewsAverageInitial());

  final ReviewRepoImpl reviewRepoImpl;

  Future<void> fetchAverageReviewMethod({required String productId}) async {
    emit(
      FetchReviewsAverageLoading(),
    );

    reviewRepoImpl.fetchReviewAverage(productId: productId).listen(
      (response) {
        response.fold(
          (failure) {
            emit(
              FetchReviewsAverageFailed(
                errorMessage: failure.errorMessage,
              ),
            );
          },
          (averageRating) {
            emit(
              FetchReviewsAverageSuccess(average: averageRating),
            );
          },
        );
      },
      onError: (error) {
        emit(
          FetchReviewsAverageFailed(
            errorMessage: error.toString(),
          ),
        );
      },
    );
  }
}
