part of 'fetch_user_id_cubit.dart';

@immutable
sealed class FetchUserIdState {}

final class FetchUserIdInitial extends FetchUserIdState {}

final class FetchUserIdLoading extends FetchUserIdState {}

final class FetchUserIdSuccess extends FetchUserIdState {
  var data;

  FetchUserIdSuccess({required this.data});
}

final class FetchUserIdFailed extends FetchUserIdState {
  final String errorMessage;

  FetchUserIdFailed({required this.errorMessage});
}
