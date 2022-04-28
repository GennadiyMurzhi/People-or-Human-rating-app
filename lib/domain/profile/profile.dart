import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';

@freezed
abstract class Profile with _$Profile {
  const factory Profile({
    required String userName,
    String? photoUrl,
    required double averageRating,
    required int userEvaluationsCount,
    required Skills skills,
  }) = _Profile;
}

@freezed
abstract class Skills with _$Skills {
  const factory Skills({
    required List<Skill> skills,
  }) = _Skills;
}

@freezed
abstract class Skill with _$Skill {
  const factory Skill({
    required String skillName,
    required double skillAverageEvaluations,
  }) = _Skill;
}
