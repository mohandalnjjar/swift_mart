import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swift_mart/features/home/data/models/product_dynamic_data.dart';
import 'package:swift_mart/features/home/data/repos/home_repo_impl.dart';

part 'fetch_dynamic_product_details_state.dart';

class FetchDynamicProductDetailsCubit
    extends Cubit<FetchDynamicProductDetailsState> {
  FetchDynamicProductDetailsCubit({required this.homeRepoImpl})
      : super(FetchDynamicProductDetailsInitial());

  final HomeRepoImpl homeRepoImpl;
  Future<void> fetchProductsMethod() async {
    homeRepoImpl.streamProductDetails().listen(
      (response) {
        response.fold(
          (failed) {
            emit(
              FetchDynamicProductDetailsFailed(
                errorMessage: failed.errorMessage,
              ),
            );
          },
          (success) {
            emit(
              FetchDynamicProductDetailsSuccess(products: success),
            );
          },
        );
      },
    );
  }
}
