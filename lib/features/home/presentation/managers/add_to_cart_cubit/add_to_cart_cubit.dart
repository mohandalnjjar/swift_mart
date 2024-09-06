import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swift_mart/features/home/data/models/product_model.dart';
import 'package:swift_mart/features/home/data/repos/home_repo_impl.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit({
    required this.homeRepoImpl,
  }) : super(AddToCartInitial());
  final HomeRepoImpl homeRepoImpl;

  Future<void> addToCartMethod({
    required ProductModel productModel,
    required String? selectedSize,
  }) async {
    emit(
      AddToCartLoading(),
    );
    var response = await homeRepoImpl.addToCart(
      productModel: productModel,
      selectedSize: selectedSize,
    );

    response.fold(
      (failed) {
        emit(
          AddToCartFailed(errorMessage: failed.errorMessage),
        );
      },
      (success) {
        emit(
          AddToCartSuccess(),
        );
      },
    );
  }
}
