part of 'upload_user_image_cubit.dart';

@immutable
sealed class UploadUserImageState {}

final class UploadUserImageInitial extends UploadUserImageState {}

final class UploadUserImageLoading extends UploadUserImageState {}

final class UploadUserImageSuccess extends UploadUserImageState {}

final class UploadUserImageFailed extends UploadUserImageState {
  final String errorMessage;

  UploadUserImageFailed({required this.errorMessage});
}
