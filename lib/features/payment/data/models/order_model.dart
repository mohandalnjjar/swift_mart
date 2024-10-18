import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String orderId;
  final String userId;
  final List<String> productIds;
  final double totalAmount;
  final String shippingAddress;
  final String shippingMethod;
  final String orderStatus;
  final Timestamp orderDate;
  final String paymentStatus;

  OrderModel({
    required this.paymentStatus,
    required this.orderId,
    required this.userId,
    required this.productIds,
    required this.totalAmount,
    required this.shippingAddress,
    required this.shippingMethod,
    required this.orderStatus,
    required this.orderDate,
  });
}





