import 'package:flutter/material.dart';
import 'package:people_rating_app/domain/profile/profile.dart';
import 'package:people_rating_app/ui/evaluation/widgets/evaluation_skill_list_text_button.dart';

class EvaluationSkillListWidget extends StatelessWidget {
  final List<Skill> skills;
  final int evaluationsCountSelectedSkill;
  final int selectedSkill;

  const EvaluationSkillListWidget({
    Key? key,
    required this.skills,
    required this.evaluationsCountSelectedSkill,
    required this.selectedSkill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
            EvaluationSkillListTextButton(
              isSelected: selectedSkill == -1,
              skillName: 'All Qualities',
              skillEvaluation: _averageEvaluationSkills(skills),
              evaluationsCountSelectedSkill: evaluationsCountSelectedSkill,
            )
          ] +
          List.generate(
            skills.length,
            (index) => EvaluationSkillListTextButton(
              isSelected: index == selectedSkill,
              skillName: skills[index].skillName,
              skillEvaluation: skills[index].skillEvaluation,
              evaluationsCountSelectedSkill: evaluationsCountSelectedSkill,
            ),
          ),
    );
  }
}

double _averageEvaluationSkills(List<Skill> skills) {
  double averageSkillEvaluation = 0;
  for (int i = 0; i < skills.length; i++) {
    averageSkillEvaluation += skills[i].skillEvaluation;
  }
  return averageSkillEvaluation / (skills.length);
}
