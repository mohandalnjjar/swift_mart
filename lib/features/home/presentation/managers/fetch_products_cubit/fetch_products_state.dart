part of 'fetch_products_cubit.dart';

@immutable
sealed class FetchProductsState {}

final class FetchProductsInitial extends FetchProductsState {}

final class FetchProductsLoading extends FetchProductsState {}

final class FetchProductsSuccess extends FetchProductsState {
  final List<ProductModel> products;

  FetchProductsSuccess({required this.products});
}

final class FetchProductsFailed extends FetchProductsState {
  final String errorMessage;

  FetchProductsFailed({required this.errorMessage});
}
