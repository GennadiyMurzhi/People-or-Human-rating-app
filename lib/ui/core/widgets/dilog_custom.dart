import 'package:flutter/material.dart';
import 'package:people_rating_app/ui/core/widgets/actions_params.dart';

class DialogCustom extends AlertDialog {
  final String titleDialog;
  final String text;
  final List<ActionParams> listActions;
  final IconData icon;
  final BuildContext context;

  DialogCustom({
    Key? key,
    required this.listActions,
    required this.text,
    required this.titleDialog,
    required this.icon,
    required this.context,
  }) : super(
          key: key,
          contentPadding: const EdgeInsets.fromLTRB(24, 16, 24, 4),
          actionsPadding: const EdgeInsets.all(24),
          insetPadding: const EdgeInsets.all(20),
          buttonPadding: EdgeInsets.zero,
          actions: List.generate(
            listActions.length,
            (index) => Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  listActions[index].onPressed();
                },
                child: Text(
                  listActions[index].label,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
          ),
          title: Column(
            children: [
              Icon(
                icon,
                color: Theme.of(context).dialogTheme.titleTextStyle!.color,
              ),
              const SizedBox(height: 16),
              Text(titleDialog),
            ],
          ),
          alignment: Alignment.center,
          content: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        );
}
