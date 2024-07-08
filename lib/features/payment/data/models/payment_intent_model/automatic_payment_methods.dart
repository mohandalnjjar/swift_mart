class AutomaticPaymentMethods {
  bool? enabled;

  AutomaticPaymentMethods({this.enabled});

  factory AutomaticPaymentMethods.fromPaymentIntentModel(
      Map<String, dynamic> json) {
    return AutomaticPaymentMethods(
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toPaymentIntentModel() => {
        'enabled': enabled,
      };
}
