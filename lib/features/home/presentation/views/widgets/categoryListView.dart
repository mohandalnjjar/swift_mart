import 'package:flutter/material.dart';
import 'package:swift_mart/core/utils/const/app_images.dart';
import 'package:swift_mart/features/home/data/models/category_model.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/category_item.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({
    super.key,
  });
  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  int selectedIndex = 0;

  final List<CategoryItmeModel> items = [
    CategoryItmeModel(
      title: 'Shose',
      onPressed: (BuildContext context) {},
      image: Assets.imagesAppIcon,
    ),
    CategoryItmeModel(
      title: 'Phones',
      onPressed: (BuildContext context) {},
      image: Assets.imagesShose,
    ),
    CategoryItmeModel(
      title: 'Laptops',
      onPressed: (BuildContext context) {},
      image: Assets.imagesAppIcon,
    ),
    CategoryItmeModel(
      title: 'TVs',
      onPressed: (BuildContext context) {},
      image: Assets.imagesAppIcon,
    ),
    CategoryItmeModel(
      title: 'Clothes',
      onPressed: (BuildContext context) {},
      image: Assets.imagesAppIcon,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () async {
            if (selectedIndex != index) {
              setState(() {
                selectedIndex = index;
              });
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CategoryItem(
              categoryItmeModel: items[index],
            ),
          ),
        ),
      ),
    );
  }
}
