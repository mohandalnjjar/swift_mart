import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:swift_mart/features/home/data/repos/home_repo_impl.dart';

part 'upload_user_image_state.dart';

class UploadUserImageCubit extends Cubit<UploadUserImageState> {
  UploadUserImageCubit({
    required this.homeRepoImpl,
  }) : super(
          UploadUserImageInitial(),
        );

  final HomeRepoImpl homeRepoImpl;

  Future<void> uploadUserimage({required ImageSource source}) async {
    emit(
      UploadUserImageLoading(),
    );
    var response = await homeRepoImpl.uploadUserimage(source: source);

    response.fold((failed) {
      emit(
        UploadUserImageFailed(
          errorMessage: failed.errorMessage,
        ),
      );
    }, (success) {
      emit(
        UploadUserImageSuccess(),
      );
    });
  }
}
