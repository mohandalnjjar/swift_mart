class AutomaticPaymentMethodsModel {
  final bool enabled;

  AutomaticPaymentMethodsModel({required this.enabled});

  factory AutomaticPaymentMethodsModel.fromJson(Map<String, dynamic> json) {
    return AutomaticPaymentMethodsModel(enabled: json['enabled']);
  }
}
