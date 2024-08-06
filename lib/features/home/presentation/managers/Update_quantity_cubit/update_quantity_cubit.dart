import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swift_mart/features/home/data/models/product_model.dart';
import 'package:swift_mart/features/home/data/repos/home_repo_impl.dart';

part 'update_quantity_state.dart';

class UpdateQuantityCubit extends Cubit<UpdateQuantityState> {
  UpdateQuantityCubit({required this.homeRepoImpl})
      : super(UpdateQuantityInitial());
  final HomeRepoImpl homeRepoImpl;

  Future<void> updateQuantity(
      {required ProductModel productModel, required bool increase}) async {
    var response = await homeRepoImpl.updateQuantity(
      productModel: productModel,
      increase: increase,
    );

    response.fold((failed) {
      emit(
        UpdateQuantityFailed(errorMessage: failed.errorMessage),
      );
    }, (success) {
      emit(
        UpdateQuantitySuccess(quantity: success),
      );
    });
  }
}
