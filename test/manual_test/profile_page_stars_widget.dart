import 'package:flutter/material.dart';
import 'package:people_rating_app/domain/profile/profile.dart';
import 'package:people_rating_app/ui/profile/widgets/average_rating_widget.dart';
import 'package:people_rating_app/ui/profile/widgets/profile_photo_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //fake data
    const profile = Profile(
      userName: 'Oliver	Ava',
      photoUrl: null,
      averageRating: 3.5,
      userEvaluationsCount: 888,
      skills: Skills(
        skills: [
          Skill(skillName: 'skillName', skillEvaluation: 3.5),
          Skill(skillName: 'skillName', skillEvaluation: 1.5),
          Skill(skillName: 'skillName', skillEvaluation: 3),
          Skill(skillName: 'skillName', skillEvaluation: 5),
          Skill(skillName: 'skillName', skillEvaluation: 2.5),
        ],
      ),
    );

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 24,
            bottom: 13,
          ),
          child: ProfilePhotoWidget(
            photoUrl: profile.photoUrl,
          ),
        ),
        Center(
          child: Text(
            profile.userName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 3,
          ),
          child: Column(
            children: List.generate(6, (index) {
              if (index == 5) {
                return const AverageRatingWidget(
                  averageRating: 5.0,
                );
              } else {
                return Column(
                  children: List.generate(10, (index2) {
                    print(index.toDouble() + index2.toDouble() / 10);

                    return AverageRatingWidget(
                      averageRating: index.toDouble() + index2.toDouble() / 10,
                    );
                  }),
                );
              }
            }),
          ),
        ),
      ],
    );
  }
}
