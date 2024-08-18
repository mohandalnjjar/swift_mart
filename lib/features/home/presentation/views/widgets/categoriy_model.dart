import 'package:flutter/material.dart';

class CategoryItemModel {
  final String title;
  final void Function(BuildContext context) onPresses;

  const CategoryItemModel({
    required this.title,
    required this.onPresses,
  });

  static List<CategoryItemModel> getCategories() {
    return [
      CategoryItemModel(title: 'All', onPresses: (context) async {}),
      CategoryItemModel(title: 'Beauty', onPresses: (context) async {}),
      CategoryItemModel(title: 'Phones', onPresses: (context) async {}),
      CategoryItemModel(title: 'Clothes', onPresses: (context) async {}),
      CategoryItemModel(title: 'Shoes', onPresses: (context) async {}),
    ];
  }
}
