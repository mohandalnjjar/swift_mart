import 'package:swift_mart/features/payment/data/models/paypal_models/order_item_model.dart';

class OrdersListModel {
  final List<OrderItemsModel> ordersList;

  OrdersListModel({
    required this.ordersList,
  });

  factory OrdersListModel.fromJson(Map<String, dynamic> json) {
    return OrdersListModel(
      ordersList: (json['ordersList'] as List<dynamic>)
          .map(
            (e) => OrderItemsModel.fromJson(json: json),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': ordersList.map((e) => e.toJson()).toList(),
    };
  }
}
