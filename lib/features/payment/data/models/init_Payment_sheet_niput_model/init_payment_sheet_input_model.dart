class InitPaymentSheetInputModel {
  final String clientSecret;
  final String customerId;
  final String customerEphemeralKeySecret;
  final String? paymentIntentClientSecret;

  InitPaymentSheetInputModel({
    required this.clientSecret,
    required this.customerId,
    required this.customerEphemeralKeySecret,
     this.paymentIntentClientSecret,
  });
}
