part of 'fetch_total_cart_price_cubit.dart';

@immutable
sealed class FetchTotalCartPriceState {}

final class FethTotalCartPriceInitial extends FetchTotalCartPriceState {}

final class FethTotalCartPriceLoading extends FetchTotalCartPriceState {}

final class FethTotalCartPriceSuccess extends FetchTotalCartPriceState {
  final double totalPrice;

  FethTotalCartPriceSuccess({required this.totalPrice});
}

final class FethTotalCartPriceFailed extends FetchTotalCartPriceState {
  final String errorMessage;

  FethTotalCartPriceFailed({required this.errorMessage});
}
