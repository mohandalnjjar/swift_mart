part of 'check_user_review_cubit.dart';

@immutable
sealed class CheckUserReviewState {}

final class CheckUserReviewInitial extends CheckUserReviewState {}

final class CheckUserReviewLoading extends CheckUserReviewState {}

final class CheckUserReviewSuccess extends CheckUserReviewState {
   final bool isReviewed;

  CheckUserReviewSuccess({required this.isReviewed});
}

final class CheckUserReviewFailed extends CheckUserReviewState {
  final String errorMessage;

  CheckUserReviewFailed({required this.errorMessage});
}
