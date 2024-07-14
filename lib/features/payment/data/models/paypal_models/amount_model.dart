import 'package:swift_mart/features/payment/data/models/paypal_models/details_model.dart';

class AmountModel {
  final String total;

  final String? currency;
  final DetailsModel? details;

  AmountModel({
    required this.details,
    required this.total,
    required this.currency,
  });

  factory AmountModel.fromJson({required Map<String, dynamic> json}) {
    return AmountModel(
      details: json['details'] == null
          ? null
          : DetailsModel.fromJson(
              json: json['details'],
            ),
      total: json['total'],
      currency: json['currency'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'currency': currency,
      'details': details?.toJson(),
    };
  }
}
