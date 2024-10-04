class ProductDynamicData {
  final String price;
  final Map<String, dynamic> quantityBySize;
  final String? discount;

  ProductDynamicData({
    required this.price,
    required this.quantityBySize,
    this.discount,
  });

  factory ProductDynamicData.fromFirebase(Map<String, dynamic> doc) {
    return ProductDynamicData(
      price: doc['price'] as String,
      quantityBySize: doc['quantityBySize'] as Map<String, dynamic>,
      discount: doc['discount'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'price': price,
      'quantityBySize': quantityBySize,
      'discount': discount,
    };
  }
}
