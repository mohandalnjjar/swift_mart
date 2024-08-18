part of 'fetch_user_data_cubit.dart';

sealed class FetchUserDataState {}

final class FetchUserDataInitial extends FetchUserDataState {}

final class FetchUserDataLoading extends FetchUserDataState {}

final class FetchUserDataSuccess extends FetchUserDataState {
  final UserModel userModel;

  FetchUserDataSuccess({required this.userModel});
}

final class FetchUserDataFailed extends FetchUserDataState {
  final String errorMessage;

  FetchUserDataFailed({required this.errorMessage});
}
