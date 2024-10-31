import 'package:freezed_annotation/freezed_annotation.dart';

import 'match_model.dart';

part 'competition_model.freezed.dart';
part 'competition_model.g.dart';

@freezed
class CompetitionModel with _$CompetitionModel {
  const factory CompetitionModel({
    String? id,
    @JsonKey(name: "api_id") String? apiId,
    String? name,
    String? logo,
    List<MatchModel>? matches,
  }) = _CompetitionModel;

  factory CompetitionModel.fromJson(Map<String, dynamic> json) =>
      _$CompetitionModelFromJson(json);
}
