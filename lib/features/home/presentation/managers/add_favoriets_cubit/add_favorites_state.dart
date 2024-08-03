part of 'add_favorites_cubit.dart';

@immutable
sealed class AddFavoritesState {}

final class AddFavoritesInitial extends AddFavoritesState {}

final class AddFavoritesLoading extends AddFavoritesState {}

final class AddFavoritesSuccess extends AddFavoritesState {}

final class AddFavoritesFailed extends AddFavoritesState {
  final String errorMessage;

  AddFavoritesFailed({required this.errorMessage});
}
