import 'package:flutter/material.dart';
import 'package:people_rating_app/ui/core/widgets/actions_params.dart';

class BannerCustom extends MaterialBanner {
  final String text;
  final List<ActionParams> listParams;

  BannerCustom({
    Key? key,
    required this.text,
    required this.listParams,
  }) : super(
          key: key,
          content: Text(text),
          actions: List.generate(
            listParams.length,
            (index) => TextButton(
              onPressed: () => listParams[index].onPressed,
              child: Text(listParams[index].label),
            ),
          ),
        );
}

