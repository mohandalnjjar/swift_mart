import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'fetch_user_id_state.dart';

class FetchUserIdCubit extends Cubit<FetchUserIdState> {
  FetchUserIdCubit() : super(FetchUserIdInitial());

  Future<void> fetchUserId({required String userId}) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .snapshots()
        .listen(
      (data) {
        emit(
          FetchUserIdSuccess(data: data),
        );
      },
      onError: (error) {
        emit(
          FetchUserIdFailed(
            errorMessage: error.toString(),
          ),
        );
      },
    );
  }
}