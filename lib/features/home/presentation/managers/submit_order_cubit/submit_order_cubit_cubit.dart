import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swift_mart/features/home/data/models/order_model.dart';
import 'package:swift_mart/features/home/data/repos/home_repo_impl.dart';

part 'submit_order_cubit_state.dart';

class SubmitOrderCubit extends Cubit<SubmitOrderCubitState> {
  SubmitOrderCubit(this.homeRepoImpl) : super(SubmitOrderCubitInitial());
  final HomeRepoImpl homeRepoImpl;

  Future<void> submitOrderMethod({required OrderModel orderModel}) async {
    emit(
      SubmitOrderCubitLoading(),
    );
    var result = await homeRepoImpl.submitOrder(orderModel: orderModel);

    result.fold(
      (failure) {
        emit(
          SubmitOrderCubitFailed(
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (success) {
        emit(
          SubmitOrderCubitSuccess(),
        );
      },
    );
  }
}
