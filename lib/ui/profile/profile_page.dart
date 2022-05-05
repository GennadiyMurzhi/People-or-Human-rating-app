import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:people_rating_app/application/main_screen_cubit/main_screen_cubit.dart';
import 'package:people_rating_app/ui/core/body_if_no_cache_error.dart';
import 'package:people_rating_app/ui/core/widgets/loading_widget.dart';
import 'package:people_rating_app/ui/profile/widgets/average_rating_widget.dart';
import 'package:people_rating_app/ui/profile/widgets/skill_list_widget.dart';
import 'package:people_rating_app/ui/profile/widgets/profile_photo_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profile = BlocProvider.of<MainScreenCubit>(context).state.profile;

    return BodyIfNoCacheError(
      body: Center(
        child: profile == null
            ? loadingWidget
            : ListView(
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
                  SkillListWidget(
                    skills: profile.skills.skills,
                  ),
                ],
              ),
      ),
    );
  }
}
