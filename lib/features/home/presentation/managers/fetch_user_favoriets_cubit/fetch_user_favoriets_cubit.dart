import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swift_mart/features/home/data/models/product_model.dart';

part 'fetch_user_favoriets_state.dart';

class FetchUserFavorietsCubit extends Cubit<FetchUserFavorietsState> {
  FetchUserFavorietsCubit() : super(FetchUserFavorietsInitial());

  Future<void> fetchFavorietsMethod() async {
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    emit(
      FetchUserFavorietsLoading(),
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .snapshots()
        .listen(
      (DocumentSnapshot<Map<String, dynamic>> data) {
        var userWish = data.get('userWish') as List<dynamic>;

        List<ProductModel> products = userWish.map((data) {
          return ProductModel.fromMap(data as Map<String, dynamic>);
        }).toList();

        emit(
          FetchUserFavorietsSuccess(
            products: products,
          ),
        );
      },
      onError: (error) {
        emit(
          FetchUserFavorietsFailed(
            errorMessage: error.toString(),
          ),
        );
      },
    );
  }
}
