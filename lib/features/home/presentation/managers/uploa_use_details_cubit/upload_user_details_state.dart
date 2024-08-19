part of 'upload_user_details_cubit.dart';

@immutable
sealed class UploadUserDetailsState {}

final class UploadUserDetailsInitial extends UploadUserDetailsState {}

final class UploadUserDetailsLoading extends UploadUserDetailsState {}

final class UploadUserDetailsSuccess extends UploadUserDetailsState {}

final class UploadUserDetailsFailed extends UploadUserDetailsState {
  final String errorMessage;

  UploadUserDetailsFailed({
    required this.errorMessage,
  });
}
