part of 'fetch_reviews_cubit.dart';

@immutable
sealed class FetchReviewsState {}

final class FetchReviewsInitial extends FetchReviewsState {}

final class FetchReviewsLoading extends FetchReviewsState {}

final class FetchReviewsSuccess extends FetchReviewsState {
  final List<ReviewModel> reviews;

  FetchReviewsSuccess({required this.reviews});
}

final class FetchReviewsFailed extends FetchReviewsState {
  final String errorMessage;

  FetchReviewsFailed({required this.errorMessage});
}
