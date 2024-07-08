import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:swift_mart/core/utils/services/api_keys.dart';
import 'package:swift_mart/core/utils/services/api_service.dart';
import 'package:swift_mart/features/payment/data/models/payment_models/payment_intent_input_model.dart';
import 'package:swift_mart/features/payment/data/models/payment_models/payment_model.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentModel> creatPaymentIntent(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.stripeSipKey,
    );

    var paymentIntentModel = PaymentModel.fromJson(response.data);

    return paymentIntentModel;
  }

  Future initPaymentSheet({required String paymentIntentCleintSecrit}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentCleintSecrit,
          merchantDisplayName: 'MuhanadBek'),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await creatPaymentIntent(
        paymentIntentInputModel: paymentIntentInputModel);

    await initPaymentSheet(
      paymentIntentCleintSecrit: paymentIntentModel.clientSecret,
    );

    await displayPaymentSheet();
  }
}
