import 'package:flutter/material.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/details_vewi_nums_list_item.dart';

class DetailsViewNumsList extends StatefulWidget {
  const DetailsViewNumsList({
    super.key,
    required this.sizes,
    required this.onSizeSelected,
    this.defaultSize,
  });

  final List<dynamic>? sizes;
  final ValueChanged<String> onSizeSelected;
  final String? defaultSize;

  @override
  State<DetailsViewNumsList> createState() => _DetailsViewNumsList();
}

class _DetailsViewNumsList extends State<DetailsViewNumsList> {
  int? activeIndex;
  @override
  void initState() {
    super.initState();

    if (widget.defaultSize != null) {
      setState(() {
        activeIndex = widget.sizes!.indexOf(widget.defaultSize);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.sizes == null || widget.sizes!.isEmpty) {
      return const SizedBox();
    } else {
      return SizedBox(
        height: 67,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.sizes!.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                if (activeIndex != index) {
                  setState(() {
                    activeIndex = index;
                  });
                  widget.onSizeSelected(
                    widget.sizes![index].toString(),
                  );
                }
              },
              child: DetailsVewiNumsListItem(
                isActive: activeIndex == index,
                sizeValue: widget.sizes![index],
              ),
            );
          },
        ),
      );
    }
  }
}
