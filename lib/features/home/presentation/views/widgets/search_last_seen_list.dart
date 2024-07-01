import 'package:flutter/material.dart';
import 'package:swift_mart/core/utils/const/app_images.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/Search_list_seen_item.dart';

class SearchLastSeenList extends StatelessWidget {
  const SearchLastSeenList({super.key});
  final List<String> items = const [
    Assets.imagesShoe2,
    Assets.imagesShose3,
    Assets.imagesShose4,
    Assets.imagesBag1,
    Assets.imagesShose,
    Assets.imagesBeauty,
    Assets.imagesLaptop,
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 78,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: SearchListSeenItem(
              image: items[index],
            ),
          );
        },
      ),
    );
  }
}
