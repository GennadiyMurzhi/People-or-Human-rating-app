import 'package:flutter/material.dart';
import 'package:people_rating_app/ui/core/widgets/stars_widget.dart';

class EvaluationSkillListTextButton extends StatelessWidget {
  final bool isSelected;
  final String skillName;
  final double skillEvaluation;
  final int evaluationsCountSelectedSkill;

  const EvaluationSkillListTextButton({
    Key? key,
    required this.isSelected,
    required this.skillName,
    required this.skillEvaluation,
    required this.evaluationsCountSelectedSkill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(
          const Size.fromHeight(30),
        ),
      ),
      onPressed: isSelected ? null : () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              skillName,
              style: TextStyle(
                color: isSelected ? const Color(0xFFD2D6D9) : const Color(0xFF5E5E5E),
                fontWeight: FontWeight.w400,
                fontSize: 15,
                fontFamily: 'Roboto',
                decoration: TextDecoration.underline,
              ),
            ),
            Column(
              children: [
                StarsWidget(
                  color: Theme.of(context).colorScheme.tertiary,
                  fillStarsIndex: skillEvaluation,
                  size: const Size(115, 14.25),
                ),
                isSelected
                    ? Text(
                        '($evaluationsCountSelectedSkill)',
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    : Container()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
