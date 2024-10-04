part of 'fetch_dynamic_product_details_cubit.dart';

@immutable
sealed class FetchDynamicProductDetailsState {}

final class FetchDynamicProductDetailsInitial
    extends FetchDynamicProductDetailsState {}

final class FetchDynamicProductDetailsSuccess
    extends FetchDynamicProductDetailsState {
  final List<ProductDynamicData> products;

  FetchDynamicProductDetailsSuccess({required this.products});
}

final class FetchDynamicProductDetailsFailed
    extends FetchDynamicProductDetailsState {
  final String errorMessage;

  FetchDynamicProductDetailsFailed({required this.errorMessage});
}
