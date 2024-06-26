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
  @override
  Widget build(BuildContext context) {
    final List<CategoryItmeModel> items = [
      CategoryItmeModel(
        title: 'Beauty',
        onPressed: (BuildContext context) {},
        image: Assets.imagesBeauty,
      ),
      CategoryItmeModel(
        title: 'Furniture',
        onPressed: (BuildContext context) {},
        image: Assets.imagesFurniture,
      ),
      CategoryItmeModel(
        title: 'Shose',
        onPressed: (BuildContext context) {},
        image: Assets.imagesShose,
      ),
      CategoryItmeModel(
        title: 'Clothing',
        onPressed: (BuildContext context) {},
        image: Assets.imagesTshirt,
      ),
      CategoryItmeModel(
        title: 'Electronics',
        onPressed: (BuildContext context) {},
        image: Assets.imagesLaptop,
      ),
    ];

    return SizedBox(
      height: 115,
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
