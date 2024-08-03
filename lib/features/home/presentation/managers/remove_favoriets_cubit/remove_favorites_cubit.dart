import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swift_mart/features/home/data/models/product_model.dart';
import 'package:swift_mart/features/home/data/repos/home_repo_impl.dart';

part 'remove_favorites_state.dart';

class RemoveFavoritesCubit extends Cubit<RemoveFavoritesState> {
  RemoveFavoritesCubit({required this.homeRepoImpl})
      : super(RemoveFavoritesInitial());

  final HomeRepoImpl homeRepoImpl;

  Future<void> removeFavoritesMethod({required ProductModel productModel}) async {
    emit(
      RemoveFavoritesInitial(),
    );
    var response =
        await homeRepoImpl.removeFavorites(productModel: productModel);

    response.fold(
      (failed) {
        emit(
          RemoveFavoritesFailed(errorMessage: failed.errorMessage),
        );
      },
      (success) {
        emit(
          RemoveFavoritesSuccess(),
        );
      },
    );
  }
}
