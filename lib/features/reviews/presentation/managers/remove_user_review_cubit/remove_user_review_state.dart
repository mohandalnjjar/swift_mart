part of 'remove_user_review_cubit.dart';

@immutable
sealed class RemoveUserReviewState {}

final class RemoveUserReviewInitial extends RemoveUserReviewState {}

final class RemoveUserReviewLoading extends RemoveUserReviewState {}

final class RemoveUserReviewSuccess extends RemoveUserReviewState {}

final class RemoveUserReviewFailed extends RemoveUserReviewState {
  final String errorMessage;

  RemoveUserReviewFailed({
    required this.errorMessage,
  });
}
