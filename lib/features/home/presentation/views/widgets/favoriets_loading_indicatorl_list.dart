
import 'package:flutter/material.dart';
import 'package:swift_mart/core/utils/widgets/fav_loading_indicator.dart';

class FavloritesLoadingIndicatorList extends StatelessWidget {
  const FavloritesLoadingIndicatorList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 3,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.all(8.0),
        child: FavorietsLoadingIndicator(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 240,
      ),
    );
  }
}
