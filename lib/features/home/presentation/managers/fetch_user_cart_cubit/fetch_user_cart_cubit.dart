import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:swift_mart/features/home/data/models/product_model.dart';

part 'fetch_user_cart_state.dart';

class FetchUserCartCubit extends Cubit<FetchUserCartState> {
  FetchUserCartCubit() : super(FetchUserCartInitial());

  Future<void> fetchUserCartMethod() async {
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    emit(
      FetchUserCartLoading(),
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .snapshots()
        .listen(
      (DocumentSnapshot<Map<String, dynamic>> data) {
        var userWish = data.get('userCart') as List<dynamic>;

        List<ProductModel> products = userWish.map((data) {
          return ProductModel.fromMap(data as Map<String, dynamic>);
        }).toList();

        emit(
          FetchUserCartSuccess(
            products: products,
          ),
        );
      },
      onError: (error) {
        emit(
          FetchUserCartFailure(
            errorMessage: error.toString(),
          ),
        );
      },
    );
  }
}
