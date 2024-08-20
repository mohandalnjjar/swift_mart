part of 'fetch_most_rated_cubit.dart';

@immutable
sealed class FetchMostRatedState {}

final class FetchMostRatedInitial extends FetchMostRatedState {}

final class FetchMostRatedLoading extends FetchMostRatedState {}

final class FetchMostRatedSuccess extends FetchMostRatedState {
  final List<ProductModel> products;

  FetchMostRatedSuccess({required this.products});
}

final class FetchMostRatedFailed extends FetchMostRatedState {
  final String errorMessage;

  FetchMostRatedFailed({required this.errorMessage});
}
