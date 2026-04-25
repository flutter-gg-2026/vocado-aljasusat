import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocado/features/team/domain/entities/team_entity.dart';
part 'team_model.freezed.dart';
part 'team_model.g.dart';

@freezed
abstract class TeamModel with _$TeamModel {
  const factory TeamModel({
    required String id,
    required String name,
    required String email,
    required String role,
  }) = _TeamModel;

  factory TeamModel.fromJson(Map<String, Object?> json) =>
      _$TeamModelFromJson(json);
}

extension TeamModelMapper on TeamModel {
  TeamEntity toEntity() {
    return TeamEntity(id: id, role: role, name: name, email: email);
  }
}
