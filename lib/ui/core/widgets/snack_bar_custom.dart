import 'package:flutter/material.dart';

class SnackBarCustom extends SnackBar {
  final String text;

  SnackBarCustom({Key? key, required this.text})
      : super(
          key: key,
          content: Text(text),
          margin: const EdgeInsets.fromLTRB(5, 0, 5, 8),
          duration: const Duration(
            seconds: 2,
            microseconds: 500,
          ),
        );
}
