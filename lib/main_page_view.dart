import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swift_mart/core/utils/widgets/gnav.dart';
import 'package:swift_mart/features/home/presentation/views/page_view_views_body.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
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
      body: MainPageViewBody(
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
          : null,
    );
  }
}
