class DetailsModel {
  final String subtotal;
  final String shipping;
  final double shippingDiscount;

  DetailsModel(
      {required this.subtotal,
      required this.shipping,
      required this.shippingDiscount});

  factory DetailsModel.fromJson({required Map<String, dynamic> json}) {
    return DetailsModel(
      subtotal: json['subtotal'],
      shipping: json['shipping'],
      shippingDiscount: json['shipping_discount'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'subtotal': subtotal,
      'shipping': shipping,
      'shipping_discount': shippingDiscount,
    };
  }
}
