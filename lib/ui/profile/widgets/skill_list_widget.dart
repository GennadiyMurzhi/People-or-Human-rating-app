import 'package:flutter/material.dart';
import 'package:people_rating_app/domain/profile/profile.dart';
import 'package:people_rating_app/ui/core/widgets/stars_widget.dart';

class SkillListWidget extends StatelessWidget {
  final List<Skill> skills;

  const SkillListWidget({
    Key? key,
    required this.skills,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        skills.length,
        (index) => TextButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all<Size>(
            const Size.fromHeight(30),
          )),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  skills[index].skillName,
                  style: const TextStyle(
                    color: Color(0xFF5E5E5E),
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    decoration: TextDecoration.underline,
                  ),
                ),
                StarsWidget(
                  color: Theme.of(context).colorScheme.tertiary,
                  fillStarsIndex: skills[index].skillEvaluation,
                  size: const Size(115, 14.25),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
