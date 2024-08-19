import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swift_mart/features/home/data/repos/home_repo_impl.dart';

part 'upload_user_details_state.dart';

class UploadUserDetailsCubit extends Cubit<UploadUserDetailsState> {
  UploadUserDetailsCubit({required this.homeRepoImpl})
      : super(UploadUserDetailsInitial());
  final HomeRepoImpl homeRepoImpl;

  Future<void> uploadUserDetails({
    required String name,
    required String phone,
  }) async {
    var response = await homeRepoImpl.uploadUserDetails(
      name: name,
      phone: phone,
    );

    response.fold((failed) {
      emit(
        UploadUserDetailsFailed(errorMessage: failed.errorMessage),
      );
    }, (success) {
      emit(
        UploadUserDetailsSuccess(),
      );
    });
  }
}
