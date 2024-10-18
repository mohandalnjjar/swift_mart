import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:swift_mart/features/home/data/repos/home_repo_impl.dart';

part 'feth_total_cart_price_state.dart';

class FethTotalCartPriceCubit extends Cubit<FetchTotalCartPriceState> {
  FethTotalCartPriceCubit(this.homeRepoImpl)
      : super(FethTotalCartPriceInitial());

  final HomeRepoImpl homeRepoImpl;

  Future<void> fetchTotalPriceMethod() async {
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    emit(
      FethTotalCartPriceLoading(),
    );
    
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .snapshots()
        .listen(
      (DocumentSnapshot<Map<String, dynamic>> data) {
        List<dynamic> array = data.get('userCart') as List<dynamic>;

        double totalPrice = 0.0;
        for (var item in array) {
          totalPrice += int.parse(item['price']) * item['quantity'];
        }
        emit(
          FethTotalCartPriceSuccess(totalPrice: totalPrice),
        );
      },
      onError: (error) {
        emit(
          FethTotalCartPriceFailed(
            errorMessage: error.toString(),
          ),
        );
      },
    );
  }
}
