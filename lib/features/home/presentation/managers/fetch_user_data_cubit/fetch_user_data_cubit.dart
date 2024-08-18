import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swift_mart/features/home/data/models/user_model.dart';

part 'fetch_user_data_state.dart';

class FetchUserDataCubit extends Cubit<FetchUserDataState> {
  FetchUserDataCubit() : super(FetchUserDataInitial());

  Future<void> fetchUserDataMethod() async {
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    emit(
      FetchUserDataLoading(),
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .snapshots()
        .listen(
      (data) {
        emit(
          FetchUserDataSuccess(
            userModel: UserModel.fromJson(
              data ,
            ),
          ),
        );
      },
      onError: (error) {
        emit(
          FetchUserDataFailed(
            errorMessage: error.toString(),
          ),
        );
      },
    );
  }
}
