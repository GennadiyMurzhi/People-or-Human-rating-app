import 'package:flutter/material.dart';

//TODO: style this
class BannerCustom extends MaterialBanner {
  final String text;

  ///keys must be of label and onPressed
  final List<Map<String, Object>> listAction;

  BannerCustom({
    Key? key,
    required this.text,
    required this.listAction,
  }) : super(
          key: key,
          content: Text(text),
          actions: List.generate(
            listAction.length,
            (index) => TextButton(
              onPressed: () => listAction[index]['onPressed'] as Function,
              child: Text(listAction[index]['label'] as String),
            ),
          ),
        );
}
