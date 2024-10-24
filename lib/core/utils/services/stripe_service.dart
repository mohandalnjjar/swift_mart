import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:swift_mart/core/utils/services/api_keys.dart';
import 'package:swift_mart/core/utils/services/api_service.dart';
import 'package:swift_mart/features/payment/data/models/ephemral_key_model/ephemral_key_model.dart';
import 'package:swift_mart/features/payment/data/models/init_Payment_sheet_niput_model/init_payment_sheet_input_model.dart';
import 'package:swift_mart/features/payment/data/models/payment_models/payment_intent_input_model.dart';
import 'package:swift_mart/features/payment/data/models/payment_models/payment_model.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<void> creatCustomertId() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    User? user = auth.currentUser;
    final uid = user!.uid;

    var response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/customers',
      token: ApiKeys.stripeAipKey,
    );

    await FirebaseFirestore.instance.collection('users').doc(uid).update(
      {
        'StripeId': response.data['id'],
      },
    );
  }

  Future<PaymentModel> creatPaymentIntent(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.stripeAipKey,
    );

    var paymentIntentModel = PaymentModel.fromJson(response.data);

    return paymentIntentModel;
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        customerId: initPaymentSheetInputModel.customerId,
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.customerEphemeralKeySecret,
        paymentIntentClientSecret:
            initPaymentSheetInputModel.paymentIntentClientSecret,
        merchantDisplayName: 'Muhanad',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<EphemralKeyModel> creatEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      body: {'customer': customerId},
      headers: {
        'Authorization': "Bearer ${ApiKeys.stripeAipKey}",
        'Stripe-Version': '2024-06-20',
      },
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      token: ApiKeys.stripeAipKey,
    );

    var ephemeralKeyModel =
        EphemralKeyModel.fromEphemralKeyModel(response.data);

    return ephemeralKeyModel;
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    //////////////////////////////////////////////////////////////
    var paymentIntentModel = await creatPaymentIntent(
      paymentIntentInputModel: paymentIntentInputModel,
    );
    //
    var ephemeralKeyModel = await creatEphemeralKey(
      customerId: paymentIntentInputModel.customerId,
    );

    //
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
      paymentIntentClientSecret: paymentIntentModel.clientSecret,
      customerId: paymentIntentInputModel.customerId,
      customerEphemeralKeySecret: ephemeralKeyModel.secret!,
    );

    await initPaymentSheet(
      initPaymentSheetInputModel: initPaymentSheetInputModel,
    );
    //
    await displayPaymentSheet();
  }
}
