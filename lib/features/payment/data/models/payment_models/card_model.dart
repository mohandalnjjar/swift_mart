class CardModel {
  final dynamic installments;
  final dynamic mandateOptions;
  final dynamic network;

  final String requestThreedSecure;

  CardModel({
    required this.installments,
    required this.mandateOptions,
    required this.network,
    required this.requestThreedSecure,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      installments: json['installments'],
      mandateOptions: json['mandate_options'],
      network: json['network'],
      requestThreedSecure: json['request_three_d_secure'],
    );
  }
}
