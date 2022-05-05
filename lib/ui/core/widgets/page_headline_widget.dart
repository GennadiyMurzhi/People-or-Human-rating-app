import 'package:flutter/material.dart';

class PageHeadlineWidget extends StatelessWidget {
  final String headline;

  ///Green headline/title with padding
  const PageHeadlineWidget({
    Key? key,
    required this.headline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
      child: Text(
        headline,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
