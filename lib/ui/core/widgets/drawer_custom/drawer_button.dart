import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  final String label;
  final Function onTap;

  const DrawerButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          const RoundedRectangleBorder(),
        ),
        overlayColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.secondary.withAlpha(50),
        ),
      ),
      onPressed: () => onTap(),
      child: Row(
        children: [
          const SizedBox(
            width: 40,
          ),
          Text(
            label,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
