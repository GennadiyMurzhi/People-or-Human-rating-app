import 'dart:math';

import 'package:flutter/material.dart';
import 'package:people_rating_app/domain/evaluation/evaluation.dart';
import 'package:people_rating_app/domain/profile/profile.dart';
import 'package:people_rating_app/ui/core/widgets/page_headline_widget.dart';
import 'package:people_rating_app/ui/evaluation/widgets/evaluation_list_slide_widget.dart';
import 'package:people_rating_app/ui/evaluation/widgets/evaluation_skill_list_widget.dart';

//fake data
const skills = Skills(
  skills: [
    Skill(skillName: 'skillName', skillEvaluation: 3.5),
    Skill(skillName: 'skillName', skillEvaluation: 1.5),
    Skill(skillName: 'skillName', skillEvaluation: 3),
    Skill(skillName: 'skillName', skillEvaluation: 5),
    Skill(skillName: 'skillName', skillEvaluation: 2.5),
  ],
);

final evaluations = Evaluations(
  evaluations: List.generate(
    20,
    (index) => Evaluation(
      evaluatorName: 'evaluatorName$index',
      evaluatedSkills: Skills(
        skills: List.generate(
          4 - Random().nextInt(4),
          (skillIndex) => Skill(
            skillName: 'skillName$skillIndex',
            skillEvaluation: (Random().nextInt(4) + Random().nextDouble().toDouble()),
          ),
        ),
      ),
      hashTagList: List.generate(7, (hashTagIndex) => 'hashTag$hashTagIndex'),
      photoUrl: null,
    ),
  ),
);

class EvaluationPage extends StatelessWidget {
  const EvaluationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageHeadlineWidget(
          headline: 'Evaluation',
        ),
        const SizedBox(
          height: 14,
        ),
        Expanded(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: EvaluationSkillListWidget(
                  skills: skills.skills,
                  evaluationsCountSelectedSkill: evaluations.evaluations.length,
                  selectedSkill: -1,
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Positioned(
                bottom: 0,
                child: EvaluationListSlideWidget(
                  expandedHeight: 432,
                  unExpandedHeight: 230,
                  evaluations: evaluations.evaluations,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
