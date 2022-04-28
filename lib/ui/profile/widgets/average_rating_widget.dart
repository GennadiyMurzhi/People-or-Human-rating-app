import 'package:flutter/material.dart';
import 'package:people_rating_app/ui/core/widgets/stars_widget.dart';

class AverageRatingWidget extends StatelessWidget {
  final double averageRating;

  const AverageRatingWidget({
    Key? key,
    required this.averageRating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StarsWidget(
          color: Theme.of(context).colorScheme.tertiary,
          fillStarsIndex: averageRating,
          size: const Size(196, 25),
        ),
        Text(
          '$averageRating of 5',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
