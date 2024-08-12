import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final double rating;
  final double size;

  const RatingBar({super.key, required this.rating, this.size = 18});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) {
          if (index < rating.floor()) {
            return Icon(Icons.star,
                color: Theme.of(context).colorScheme.primary, size: size);
          } else if (index == rating.floor() && rating % 1 != 0) {
            return Stack(
              children: [
                Icon(Icons.star,
                    color: Theme.of(context).colorScheme.primary, size: size),
                ClipRect(
                  clipper: _HalfClipper(),
                  child: Icon(Icons.star, color: Colors.grey, size: size),
                ),
              ],
            );
          } else {
            return Icon(Icons.star, color: Colors.grey, size: size);
          }
        },
      ),
    );
  }
}

class _HalfClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(size.width / 2, 0.0, size.width, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}
