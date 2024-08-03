part of 'fetch_user_cart_cubit.dart';

@immutable
sealed class FetchUserCartState {}

final class FetchUserCartInitial extends FetchUserCartState {}

final class FetchUserCartLoading extends FetchUserCartState {}

final class FetchUserCartSuccess extends FetchUserCartState {
  final List<ProductModel> products;

  FetchUserCartSuccess({required this.products});
}

final class FetchUserCartFailure extends FetchUserCartState {
  final String errorMessage;

  FetchUserCartFailure({required this.errorMessage});
}
