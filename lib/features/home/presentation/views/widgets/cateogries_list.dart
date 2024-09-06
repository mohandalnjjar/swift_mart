import 'package:flutter/material.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/category_item.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/categoriy_model.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({
    super.key,
  });

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int selectedIndex = 0;

  final List<CategoryItemModel> categories = CategoryItemModel.getCategories();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43,
      child: Padding(
        padding: const EdgeInsets.only(right: 13.0),
        child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
                categories[index].onPresses(context);
              });
            },
            child: ActiveCateogryItem(
              isActive: selectedIndex == index,
              categoryItemModel: categories[index],
            ),
          ),
        ),
      ),
    );
  }
}
