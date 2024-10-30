import 'package:freezed_annotation/freezed_annotation.dart';

import 'team_model.dart';

part 'match_model.freezed.dart';
part 'match_model.g.dart';

@freezed
class MatchModel with _$MatchModel {
  const factory MatchModel({
    required String? id,
    @JsonKey(name: "api_id") String? apiId,
    @JsonKey(name: "home_team") TeamModel? homeTeam,
    @JsonKey(name: "away_team") TeamModel? awayTeam,
    @JsonKey(name: "match_status_id") int? matchStatusId,
    @JsonKey(name: "match_status_description")
    required String matchStatusDescription,
    @JsonKey(name: "match_day") String? matchDay,
    @JsonKey(name: "match_time") String? matchTime,
    @JsonKey(name: "kick_off") int? kickOff,
    @JsonKey(name: "must_display") int? mustDisplay,
    int? published,
  }) = _MatchModel;

  factory MatchModel.fromJson(Map<String, dynamic> json) =>
      _$MatchModelFromJson(json);
}
