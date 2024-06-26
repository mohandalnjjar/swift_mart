import 'package:flutter/material.dart';

class CategoryItmeModel {
  final String title;
  final void Function(BuildContext context) onPressed;
  final String image;

  const CategoryItmeModel({
    required this.image,
    required this.title,
    required this.onPressed,
  });
}
