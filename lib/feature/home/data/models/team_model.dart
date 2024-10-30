import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_model.freezed.dart';
part 'team_model.g.dart';

@freezed
class TeamModel with _$TeamModel {
  const factory TeamModel({
    String? id,
    @JsonKey(name: "api_id") String? apiId,
    String? name,
    @JsonKey(name: "short_name") String? shortName,
    String? logo,
    List<int>? score,
    String? shirt,
    @JsonKey(name: "is_default_shirt") bool? isDefaultShirt,
    bool? national,
  }) = _TeamModel;

  factory TeamModel.fromJson(Map<String, dynamic> json) =>
      _$TeamModelFromJson(json);
}
