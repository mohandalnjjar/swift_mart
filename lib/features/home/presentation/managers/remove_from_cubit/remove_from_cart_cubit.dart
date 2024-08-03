import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swift_mart/features/home/data/models/product_model.dart';

import '../../../data/repos/home_repo_impl.dart';

part 'remove_from_cart_state.dart';

class RemoveFromCartCubit extends Cubit<RemoveFromCartState> {
  RemoveFromCartCubit({required this.homeRepoImpl})
      : super(RemoveFromCartInitial());
  final HomeRepoImpl homeRepoImpl;

  Future<void> removeToCartMethod({required ProductModel productModel}) async {
    emit(
      RemoveFromCartLoading(),
    );
    var response =
        await homeRepoImpl.removeFromCart(productModel: productModel);

    response.fold(
      (failed) {
        emit(
          RemoveFromCartFailure(errorMessage: failed.errorMessage),
        );
      },
      (success) {
        emit(
          RemoveFromCartSuccess(),
        );
      },
    );
  }
}
