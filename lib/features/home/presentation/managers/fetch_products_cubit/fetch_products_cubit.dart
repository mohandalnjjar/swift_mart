import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swift_mart/features/home/data/models/product_model.dart';
import 'package:swift_mart/features/home/data/repos/home_repo_impl.dart';

part 'fetch_products_state.dart';

class FetchProductsCubit extends Cubit<FetchProductsState> {
  FetchProductsCubit(this.homeRepoImpl) : super(FetchProductsInitial());
  final HomeRepoImpl homeRepoImpl;

  Future<void> fetchProductsMethod({required int limit}) async {
    homeRepoImpl.fetchProducts(limit: limit).listen(
      (response) {
        response.fold(
          (failed) {
            emit(
              FetchProductsFailed(errorMessage: failed.errorMessage),
            );
          },
          (success) {
            emit(
              FetchProductsSuccess(products: success),
            );
          },
        );
      },
    );
  }
}
