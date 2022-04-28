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

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
}

@freezed
class Skills with _$Skills {
  const factory Skills({
    required List<Skill> skills,
  }) = _Skills;

  factory Skills.fromJson(Map<String, dynamic> json) => _$SkillsFromJson(json);
}

@freezed
class Skill with _$Skill {
  const factory Skill({
    required String skillName,
    required double skillAverageEvaluations,
  }) = _Skill;

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);
}
