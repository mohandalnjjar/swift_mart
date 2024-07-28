class ProductModel {
  
  final String title;
  final String price;
  final String description;
  final String category;
  final String quantity;
  final String? discount;
  final List<dynamic> images;
  final List<dynamic>? sizes;

  ProductModel({
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.quantity,
    this.discount,
    required this.images,
    this.sizes,
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
    );
  }
}
