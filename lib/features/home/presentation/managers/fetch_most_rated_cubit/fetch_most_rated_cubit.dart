import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swift_mart/features/home/data/models/product_model.dart';
import 'package:swift_mart/features/home/data/repos/home_repo_impl.dart';

part 'fetch_most_rated_state.dart';

class FetchMostRatedCubit extends Cubit<FetchMostRatedState> {
  FetchMostRatedCubit({required this.homeRepoImpl})
      : super(FetchMostRatedInitial());

  final HomeRepoImpl homeRepoImpl;

  Future<void> mostRatedProductMethod({required int limit}) async {
    homeRepoImpl.fetchMostRatedProducts(limit: limit).listen(
      (response) {
        response.fold(
          (failed) {
            emit(
              FetchMostRatedFailed(
                errorMessage: failed.errorMessage,
              ),
            );
          },
          (success) {
            emit(
              FetchMostRatedSuccess(
                products: success,
              ),
            );
          },
        );
      },
    );
  }
}
