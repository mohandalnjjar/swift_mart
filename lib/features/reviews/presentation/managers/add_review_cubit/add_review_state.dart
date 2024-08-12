part of 'add_review_cubit.dart';

@immutable
sealed class AddReviewCubitState {}

final class AddReviewInitial extends AddReviewCubitState {}

final class AddReviewLoading extends AddReviewCubitState {}

final class AddReviewSuccess extends AddReviewCubitState {}

final class AddReviewFailed extends AddReviewCubitState {
  final String errorMeassage;

  AddReviewFailed({required this.errorMeassage});
}
