import 'package:freezed_annotation/freezed_annotation.dart';
import 'competition_model.dart';
import 'match_model.dart';

part 'competition_with_matches_model.freezed.dart';
part 'competition_with_matches_model.g.dart';

@freezed
class CompetitionWithMatchesModel with _$CompetitionWithMatchesModel {
  const factory CompetitionWithMatchesModel({
    CompetitionModel? competition,
    List<MatchModel>? matches,
  }) = _CompetitionWithMatchesModel;

  factory CompetitionWithMatchesModel.fromJson(Map<String, dynamic> json) =>
      _$CompetitionWithMatchesModelFromJson(json);
}
