import 'package:flutter/material.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/details_vewi_nums_list_item.dart';

class DetailsViewNumsList extends StatefulWidget {
  const DetailsViewNumsList({
    super.key,
  });

  @override
  State<DetailsViewNumsList> createState() => _DetailsViewNumsList();
}

class _DetailsViewNumsList extends State<DetailsViewNumsList> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            if (activeIndex != index) {
              setState(() {
                activeIndex = index;
              });
            }
          },
          child: DetailsVewiNumsListItem(
            isActive: activeIndex == index,
          ),
        );
      },
    );
  }
}
