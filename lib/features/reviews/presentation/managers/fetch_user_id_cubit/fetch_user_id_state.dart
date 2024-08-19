part of 'fetch_user_id_cubit.dart';

@immutable
sealed class FetchUserIdState {}

final class FetchUserIdInitial extends FetchUserIdState {}

final class FetchUserIdLoading extends FetchUserIdState {}

// ignore: must_be_immutable
final class FetchUserIdSuccess extends FetchUserIdState {
  UserModel userModel;

  FetchUserIdSuccess({required this.userModel});
}

final class FetchUserIdFailed extends FetchUserIdState {
  final String errorMessage;

  FetchUserIdFailed({required this.errorMessage});
}
