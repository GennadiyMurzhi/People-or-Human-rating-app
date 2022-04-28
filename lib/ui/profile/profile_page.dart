import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:people_rating_app/application/main_screen_cubit/main_screen_cubit.dart';
import 'package:people_rating_app/domain/profile/profile.dart';
import 'package:people_rating_app/ui/profile/widgets/average_rating_widget.dart';
import 'package:people_rating_app/ui/profile/widgets/skills_list_widget.dart';
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
          Skill(skillName: 'Flutter', skillAverageEvaluations: 3.3),
          Skill(skillName: 'PHP', skillAverageEvaluations: 1.7),
          Skill(skillName: 'Java', skillAverageEvaluations: 2.3),
          Skill(skillName: 'Design', skillAverageEvaluations: 5),
          Skill(skillName: 'HTML/CSS', skillAverageEvaluations: 2.5),
        ],
      ),
    );

    return Center(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
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
            child: AverageRatingWidget(
              averageRating: profile.averageRating,
            ),
          ),
          Center(
            child: Text(
              'Total Rating Of All Qualities',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
            ),
          ),
          Center(
            child: TextButton(
              style: Theme.of(context).textButtonTheme.style!.copyWith(
                    minimumSize: MaterialStateProperty.all<Size>(
                      const Size.fromHeight(22.5),
                    ),
                  ),
              child: Text(
                '${profile.userEvaluationsCount} Evaluations',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              onPressed: () => BlocProvider.of<MainScreenCubit>(context).onTapToBottomBar(2),
            ),
          ),
          SkillsListWidget(
            skills: profile.skills.skills,
          ),
        ],
      ),
    );
  }
}
