import 'package:flutter/material.dart';
import 'package:swift_mart/features/reviews/presentation/views/widgets/rating_view_body.dart';

class RattingView extends StatelessWidget {
  const RattingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RatingViewBody(),
    );
  }
}
