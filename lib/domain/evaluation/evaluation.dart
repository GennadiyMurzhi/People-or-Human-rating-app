import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:people_rating_app/domain/profile/profile.dart';

part 'evaluation.freezed.dart';

part 'evaluation.g.dart';

@freezed
class Evaluations with _$Evaluations {
  const factory Evaluations({
    required List<Evaluation> evaluations,
  }) = _Evaluations;

  factory Evaluations.fromJson(Map<String, dynamic> json) => _$EvaluationsFromJson(json);
}

@freezed
class Evaluation with _$Evaluation {
  const factory Evaluation({
    required String evaluatorName,
    required Skills evaluatedSkills,
    required List<String> hashTagList,
    required String? photoUrl,
  }) = _Evaluation;

  factory Evaluation.fromJson(Map<String, dynamic> json) => _$EvaluationFromJson(json);
}