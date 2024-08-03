part of 'fetch_user_favoriets_cubit.dart';

@immutable
sealed class FetchUserFavorietsState {}

final class FetchUserFavorietsInitial extends FetchUserFavorietsState {}

final class FetchUserFavorietsLoading extends FetchUserFavorietsState {}

final class FetchUserFavorietsSuccess extends FetchUserFavorietsState {
  final List<ProductModel> products;

  FetchUserFavorietsSuccess({required this.products});
}

final class FetchUserFavorietsFailed extends FetchUserFavorietsState {
  final String errorMessage;

  FetchUserFavorietsFailed({required this.errorMessage});
}
