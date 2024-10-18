import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swift_mart/features/home/data/repos/home_repo_impl.dart';

part 'check_available_quantity_state.dart';

class CheckAvailableQuantityCubit extends Cubit<CheckAvailableQuantityState> {
  CheckAvailableQuantityCubit(this.homeRepoImpl)
      : super(
          CheckAvailableQuantityInitial(),
        );

  final HomeRepoImpl homeRepoImpl;

  Future<void> checkAvailableQuantityMethod() async {
    emit(
      CheckAvailableQuantityLoading(),
    );
    var response = await homeRepoImpl.checkProductAvailability();
    response.fold((failure) {
      emit(
        CheckAvailableQuantityFailed(errorMessage: failure.errorMessage),
      );
    }, (success) {
      emit(
        CheckAvailableQuantitySuccess(),
      );
    });
  }
}
