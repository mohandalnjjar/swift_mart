import 'package:flutter/material.dart';
import 'package:swift_mart/features/home/presentation/views/widgets/my_fav_view_body.dart';

class MyFavView extends StatelessWidget {
  const MyFavView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: MyFavViewBody(),
      ),
    );
  }
}
