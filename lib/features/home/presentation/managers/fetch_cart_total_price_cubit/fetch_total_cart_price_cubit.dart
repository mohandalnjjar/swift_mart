import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:swift_mart/features/home/data/models/order_finance_details.dart';
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

        OrderFinanceDetails orderFinanceDetails = OrderFinanceDetails();

        for (var item in array) {
          orderFinanceDetails = OrderFinanceDetails(
            supTotalPrice: orderFinanceDetails.supTotalPrice +
                int.parse(item['price']) * item['quantity'],
            totalShippingCoast: orderFinanceDetails.totalShippingCoast +
                item['shipping_cost'].toDouble(),
          );
        }

        emit(
          FethTotalCartPriceSuccess(orderFinanceDetails: orderFinanceDetails),
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
