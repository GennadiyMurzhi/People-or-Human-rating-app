import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';

part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    required String userName,
    String? photoUrl,
    required double averageRating,
    required int userEvaluationsCount,
    required Skills skills,
  }) = _Profile;

  factory Profile.empty() => Profile(
        userName: '',
        averageRating: 0,
        userEvaluationsCount: 0,
        skills: Skills.empty(),
      );

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
}

@freezed
class Skills with _$Skills {
  const factory Skills({
    required List<Skill> skills,
  }) = _Skills;

  factory Skills.empty() => Skills(
        skills: List<Skill>.empty(),
      );

  factory Skills.fromJson(Map<String, dynamic> json) => _$SkillsFromJson(json);
}

@freezed
class Skill with _$Skill {
  const factory Skill({
    required String skillName,
    required double skillEvaluation,
  }) = _Skill;

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);
}
