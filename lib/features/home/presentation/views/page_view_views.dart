import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swift_mart/core/utils/widgets/gnav.dart';
import 'package:swift_mart/features/home/presentation/views/page_view_views_body.dart';

class PageViewViews extends StatefulWidget {
  const PageViewViews({super.key});

  @override
  State<PageViewViews> createState() => _PageViewViewsState();
}

class _PageViewViewsState extends State<PageViewViews> {
  late PageController controller;
  int currentScreen = 0;
  @override
  void initState() {
    controller = PageController(initialPage: currentScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageViewViewBody(
          controller: controller,
          onPageChanged: (value) {
            setState(
              () {
                currentScreen = value;
              },
            );
          },
        ),
        bottomNavigationBar: MediaQuery.sizeOf(context).width < 900
            ? Gnav(
                currentScreen: currentScreen,
                onTabChange: (value) {
                  setState(() {
                    currentScreen = value;
                    controller.jumpToPage(currentScreen);
                  });
                },
              )
            : null);
  }
}
