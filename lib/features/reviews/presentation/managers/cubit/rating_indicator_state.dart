part of 'rating_indicator_cubit.dart';

@immutable
sealed class RatingIndicatorState {}

final class RatingIndicatorInitial extends RatingIndicatorState {}

final class RatingIndicatorLoading extends RatingIndicatorState {}

final class RatingIndicatorSuccess extends RatingIndicatorState {
  final StarRatingCounts starRatingCounts;

  RatingIndicatorSuccess({required this.starRatingCounts});
}

final class RatingIndicatorFailed extends RatingIndicatorState {
  final String errorMessage;

  RatingIndicatorFailed({required this.errorMessage});
}
