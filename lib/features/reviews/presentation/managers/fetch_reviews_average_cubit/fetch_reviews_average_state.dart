part of 'fetch_reviews_average_cubit.dart';

@immutable
sealed class FetchReviewsAverageState {}

final class FetchReviewsAverageInitial extends FetchReviewsAverageState {}

final class FetchReviewsAverageLoading extends FetchReviewsAverageState {}

final class FetchReviewsAverageSuccess extends FetchReviewsAverageState {
  final double average;

  FetchReviewsAverageSuccess({required this.average});
}

final class FetchReviewsAverageFailed extends FetchReviewsAverageState {
  final String errorMessage;

  FetchReviewsAverageFailed({required this.errorMessage});
}
