class ProductModel {
  final String title;
  final String price;
  final String description;
  final String category;
  int quantity;
  final String? discount;
  final double shippingCost;

  final List<dynamic> images;
  final List<dynamic>? sizes;
  final String id;
  final String? selectedSize;
  final Map<String, dynamic>? quantityBySize;

  ProductModel({
    required this.shippingCost,
    required this.id,
    required this.selectedSize,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.quantity,
    this.discount,
    required this.images,
    this.sizes,
    this.quantityBySize,
  });

  factory ProductModel.fromFireBase(Map<String, dynamic> doc) {
    return ProductModel(
      title: doc['title'],
      price: doc['price'],
      description: doc['description'] ?? 'there is no description for this product',
      category: doc['category'],
      quantity: doc['quantity'] ?? 0,
      images: doc['Images'],
      sizes: doc['sizes'],
      id: doc['id'],
      selectedSize: doc['selectedSize'],
      quantityBySize: doc['quantityBySize'],
      shippingCost: doc['shipping_cost'] ?? 0.0,
    );
  }

  factory ProductModel.fromMap(Map<String, dynamic> data) {
    return ProductModel(
      id: data['id'],
      title: data['title'],
      price: data['price'],
      description: data['description'] ?? 'there is no description for this product',
      category: data['category'],
      quantity: data['quantity'] ?? 0,
      images: data['Images'],
      discount: data['discount'],
      sizes: data['sizes'],
      selectedSize: data['selectedSize'],
      quantityBySize: data['quantityBySize'],
      shippingCost: data['shipping_cost'] ?? 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Images': images,
      'category': category,
      'description': description,
      'discount': discount,
      'price': price,
      'sizes': sizes,
      'title': title,
      'id': id,
      'quantity': quantity,
      'selectedSize': selectedSize,
      'quantityBySize': quantityBySize,
      'shipping_cost': shippingCost,
    };
  }

  Map<String, dynamic> addSelected({
    required String? selectedSize,
  }) {
    return {
      'Images': images,
      'category': category,
      'description': description,
      'discount': discount,
      'price': price,
      'sizes': sizes,
      'title': title,
      'id': id,
      'quantity': quantity,
      'selectedSize': selectedSize,
      'quantityBySize': quantityBySize,
      'shipping_cost': shippingCost,
    };
  }
}
