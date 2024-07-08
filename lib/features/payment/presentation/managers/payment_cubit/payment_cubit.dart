import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swift_mart/features/payment/data/models/payment_models/payment_intent_input_model.dart';
import 'package:swift_mart/features/payment/data/repos/check_out_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkOutRepo) : super(PaymentInitial());

  final CheckOutRepo checkOutRepo;

  Future<void> makePaymentMethod(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(
      PaymentLoading(),
    );
    var respose = await checkOutRepo.makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );

    respose.fold(
      (failure) {
        emit(
          PaymentFailure(faiulreMessage: failure.errorMessage),
        );
      },
      (paymentDone) {
        emit(
          PaymentSuccess(),
        );
      },
    );
  }
}
