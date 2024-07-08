import 'card.dart';
import 'link.dart';

class PaymentMethodOptions {
  Card? card;
  Link? link;

  PaymentMethodOptions({this.card, this.link});

  factory PaymentMethodOptions.fromPaymentIntentModel(
      Map<String, dynamic> json) {
    return PaymentMethodOptions(
      card: json['card'] == null
          ? null
          : Card.fromPaymentIntentModel(json['card'] as Map<String, dynamic>),
      link: json['link'] == null
          ? null
          : Link.fromPaymentIntentModel(json['link'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toPaymentIntentModel() => {
        'card': card?.toPaymentIntentModel(),
        'link': link?.toPaymentIntentModel(),
      };
}
