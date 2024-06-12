import 'package:flutter/material.dart';
import 'package:swift_mart/core/utils/services/app_router.dart';

void main(List<String> args) {
  runApp(
    const SwiftMart(),
  );
}

class SwiftMart extends StatelessWidget {
  const SwiftMart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
