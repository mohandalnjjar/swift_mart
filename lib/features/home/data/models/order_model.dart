import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swift_mart/features/home/data/models/product_model.dart';
import 'package:uuid/uuid.dart';

class OrderModel {
  final String orderId;
  final List<ProductModel> products;
  final double subTotalPrice;
  final double totalPrice;
  final double shippingCost;
  final String shippingAddress;
  final String shippingMethod;
  final String orderStatus;
  final DateTime orderDate; // Using DateTime instead of Timestamp
  final String paymentStatus;
  static const Uuid _uuid = Uuid();

  OrderModel({
    required this.subTotalPrice,
    required this.shippingCost,
    required this.paymentStatus,
    String? orderId, // Make orderId optional
    required this.products,
    required this.totalPrice,
    required this.shippingAddress,
    required this.shippingMethod,
    required this.orderStatus,
    required this.orderDate,
  }) : orderId = orderId ?? _uuid.v4(); // Assign UUID if orderId is null

  // Factory method for converting from Firestore document
  factory OrderModel.fromMap(Map<String, dynamic> data) {
    return OrderModel(
      subTotalPrice: data['subTotalPrice'],
      shippingCost: data['shippingCost'],
      paymentStatus: data['paymentStatus'],
      orderId: data['orderId'],
      products: (data['products'] as List)
          .map((item) => ProductModel.fromMap(item))
          .toList(),
      totalPrice: data['totalPrice'],
      shippingAddress: data['shippingAddress'],
      shippingMethod: data['shippingMethod'],
      orderStatus: data['orderStatus'],
      orderDate: (data['orderDate'] as Timestamp)
          .toDate(), // Firestore Timestamp to DateTime
    );
  }

  // Method for converting to Firestore document
  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'subTotalPrice': subTotalPrice,
      'shippingCost': shippingCost,
      'paymentStatus': paymentStatus,
      'products': products.map((item) => item.toMap()).toList(),
      'totalPrice': totalPrice,
      'shippingAddress': shippingAddress,
      'shippingMethod': shippingMethod,
      'orderStatus': orderStatus,
      'orderDate':
          Timestamp.fromDate(orderDate), // DateTime to Firestore Timestamp
    };
  }
}
