import 'package:flutter/material.dart';
import 'package:people_rating_app/domain/profile/profile.dart';
import 'package:people_rating_app/ui/core/widgets/is_photo_widget.dart';
import 'package:people_rating_app/ui/core/widgets/stars_widget.dart';

class EvaluationWidget extends StatelessWidget {
  final String? photoUrl;
  final String evaluatorName;
  final List<Skill> evaluatedSkills;
  final List<String> hashTagList;

  const EvaluationWidget({
    Key? key,
    required this.photoUrl,
    required this.evaluatorName,
    required this.evaluatedSkills,
    required this.hashTagList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double diameter = 44;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: diameter,
          height: diameter,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: IsPhotoWidget(
            diameter: diameter,
            photoUrl: photoUrl,
          ),
        ),
        const SizedBox(width: 17),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                evaluatorName,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 3),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'rated: ',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          decoration: TextDecoration.none,
                        ),
                  ),
                  const SizedBox(width: 3),
                  Column(
                    children: List.generate(
                      evaluatedSkills.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              evaluatedSkills[index].skillName,
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 13),
                            ),
                            StarsWidget(
                              color: Theme.of(context).colorScheme.tertiary,
                              fillStarsIndex: evaluatedSkills[index].skillEvaluation,
                              size: const Size(115, 14.25),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 7),
              Wrap(
                children: List.generate(
                  hashTagList.length,
                  (index) => Text(
                    '#${hashTagList[index]}${index == hashTagList.length - 1 ? '' : ','}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
