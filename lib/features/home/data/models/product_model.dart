class ProductModel {
  final String id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String? discount;
  final List<dynamic> images;
  final List<dynamic>? sizes;
  final String? selectedSize;
  final Map<String, dynamic>? quantityBySize;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    this.discount,
    required this.images,
    this.sizes,
    this.selectedSize,
    this.quantityBySize,
  });

  // Factory constructor for creating ProductModel from Firestore data
  factory ProductModel.fromFirebase(Map<String, dynamic> doc) {
    return ProductModel(
      id: doc['id'] as String,
      title: doc['title'] as String,
      price: doc['price'] as String,
      description: doc['description'] as String,
      category: doc['category'] as String,
      images: List<dynamic>.from(doc['Images'] ?? []),
      sizes: doc['sizes'] != null ? List<dynamic>.from(doc['sizes']) : null,
      discount: doc['discount'] as String?,
      selectedSize: doc['selectedSize'] as String?,
      quantityBySize: doc['quantityBySize'] as Map<String, dynamic>?,
    );
  }

  // Factory constructor for creating ProductModel from a generic map (e.g. for local storage)
  factory ProductModel.fromMap(Map<String, dynamic> data) {
    return ProductModel(
      id: data['id'] as String,
      title: data['title'] as String,
      price: data['price'] as String,
      description: data['description'] as String,
      category: data['category'] as String,
      images: List<dynamic>.from(data['Images'] ?? []),
      sizes: data['sizes'] != null ? List<dynamic>.from(data['sizes']) : null,
      discount: data['discount'] as String?,
      selectedSize: data['selectedSize'] as String?,
      quantityBySize: data['quantityBySize'] as Map<String, dynamic>?,
    );
  }

  // Convert ProductModel to a map, useful for Firestore or other storage solutions
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'Images': images,
      'sizes': sizes,
      'discount': discount,
      'selectedSize': selectedSize,
      'quantityBySize': quantityBySize,
    };
  }

  // Method to return the map with a modified selected size (can be useful for updating selected size)
  Map<String, dynamic> addSelectedSize({required String? selectedSize}) {
    return {
      ...toMap(), // Spread the existing map
      'selectedSize': selectedSize, // Update the selected size
    };
  }
}
