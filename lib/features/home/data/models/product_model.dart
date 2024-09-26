class ProductModel {
  final String title;
  final String price;
  final String description;
  final String category;
  int quantity;
  final String? discount;
  final List<dynamic> images;
  final List<dynamic>? sizes;
  final String id;
  final String? selectedSize;
  final Map<String, dynamic>? quantityBySize;

  ProductModel({
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
      description: doc['description'],
      category: doc['category'],
      quantity: doc['quantity'],
      images: doc['Images'],
      sizes: doc['sizes'],
      id: doc['id'],
      selectedSize: doc['selectedSize'],
      quantityBySize: doc['quantityBySize'],
    );
  }

  factory ProductModel.fromMap(Map<String, dynamic> data) {
    return ProductModel(
      id: data['id'],
      title: data['title'],
      price: data['price'],
      description: data['description'],
      category: data['category'],
      quantity: data['quantity'],
      images: data['Images'],
      discount: data['discount'],
      sizes: data['sizes'],
      selectedSize: data['selectedSize'],
      quantityBySize: data['quantityBySize'],
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
    };
  }
}
