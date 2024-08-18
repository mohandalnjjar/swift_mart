import 'package:flutter/material.dart';

class CustomRatingBar extends StatefulWidget {
  final double initialRating;
  final ValueChanged<double> onRatingChanged;

  const CustomRatingBar({
    super.key,
    required this.initialRating,
    required this.onRatingChanged,
  });

  @override
  _CustomRatingBarState createState() => _CustomRatingBarState();
}

class _CustomRatingBarState extends State<CustomRatingBar> {
  late double _currentRating;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) {
          return GestureDetector(
            onTap: () {
              setState(
                () {
                  double newRating = index + 1.0;
                  _currentRating = newRating;

                  widget.onRatingChanged(_currentRating);
                },
              );
            },
            child: Icon(
              _currentRating >= index + 1
                  ? Icons.star
                  : _currentRating >= index + 0.5
                      ? Icons.star_half
                      : Icons.star_border,
              color: Colors.amber,
              size: 40.0,
            ),
          );
        },
      ),
    );
  }
}
