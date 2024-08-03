import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swift_mart/features/home/data/models/product_model.dart';
import 'package:swift_mart/features/home/data/repos/home_repo_impl.dart';

part 'add_favorites_state.dart';

class AddFavoritesCubit extends Cubit<AddFavoritesState> {
  AddFavoritesCubit({required this.homeRepoImpl})
      : super(AddFavoritesInitial());
  final HomeRepoImpl homeRepoImpl;

  Future<void> addFavoritesMethod({required ProductModel productModel}) async {
    emit(
      AddFavoritesLoading(),
    );
    var response = await homeRepoImpl.addFavorites(productModel: productModel);

    response.fold(
      (failed) {
        emit(
          AddFavoritesFailed(errorMessage: failed.errorMessage),
        );
      },
      (success) {
        emit(
          AddFavoritesSuccess(),
        );
      },
    );
  }
}
