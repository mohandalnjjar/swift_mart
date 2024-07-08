import 'package:swift_mart/features/payment/data/models/payment_models/card_model.dart';
import 'package:swift_mart/features/payment/data/models/payment_models/link_model.dart';

class Paymentmethodoptions {
  final CardModel? card;

  final LinkModel? link;

  Paymentmethodoptions({required this.card, required this.link});

  factory Paymentmethodoptions.fromJson(Map<String, dynamic> json) {
    return Paymentmethodoptions(
      card: json['card'] == null
          ? null
          : CardModel.fromJson(
              json['card'],
            ),
      link: json['link'] == null
          ? null
          : LinkModel.fromJson(
              json['link'],
            ),
    );
  }
}
