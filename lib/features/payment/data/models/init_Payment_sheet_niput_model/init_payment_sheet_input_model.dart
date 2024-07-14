class InitPaymentSheetInputModel {
  final String paymentIntentClientSecret;
  final String customerId;
  final String customerEphemeralKeySecret;

  InitPaymentSheetInputModel({
    required this.paymentIntentClientSecret,
    required this.customerId,
    required this.customerEphemeralKeySecret,
  });
}
