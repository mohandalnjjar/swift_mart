part of 'fetch_user_data_cubit.dart';

sealed class FetchUserDataState {}

final class FetchUserDataInitial extends FetchUserDataState {}

final class FetchUserDataLoading extends FetchUserDataState {}

final class FetchUserDataDone extends FetchUserDataState {
  final DocumentSnapshot<Map<String, dynamic>> data;

  FetchUserDataDone({required this.data});
}

final class FetchUserDataFailed extends FetchUserDataState {
  final String errorMessage;

  FetchUserDataFailed({required this.errorMessage});
}
