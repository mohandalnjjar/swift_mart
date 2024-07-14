class OrderItemsModel {
  final String name;
  final int quantity;
  final String price;
  final String currency;

  OrderItemsModel({
    required this.name,
    required this.quantity,
    required this.price,
    required this.currency,
  });

  factory OrderItemsModel.fromJson({required Map<String, dynamic> json}) {
    return OrderItemsModel(
      name: json['name'],
      quantity: json['quantity'],
      price: json['price'],
      currency: json['currency'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
      'currency': currency,
    };
  }
}
