import 'package:dartz/dartz.dart';
import 'package:swift_mart/core/errors/failures.dart';
import 'package:swift_mart/core/utils/services/stripe_service.dart';
import 'package:swift_mart/features/payment/data/models/payment_models/payment_intent_input_model.dart';
import 'package:swift_mart/features/payment/data/repos/check_out_repo.dart';

class CheckOutRepoImpl extends CheckOutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );

      return right(null);
    } catch (e) {
      return left(
        StripeFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
