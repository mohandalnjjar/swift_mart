class AmountDetailsModel {
  final Map<String, dynamic> amountDetails;

  AmountDetailsModel({required this.amountDetails});
  factory AmountDetailsModel.fromJson(Map<String, dynamic> json) {
    return AmountDetailsModel(amountDetails: json['tip']);
  }
}
