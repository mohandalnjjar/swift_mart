import 'tip.dart';

class AmountDetails {
  Tip? tip;

  AmountDetails({this.tip});

  factory AmountDetails.fromPaymentIntentModel(Map<String, dynamic> json) {
    return AmountDetails(
      tip: json['tip'] == null
          ? null
          : Tip.fromPaymentIntentModel(json['tip'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toPaymentIntentModel() => {
        'tip': tip?.toPaymentIntentModel(),
      };
}
