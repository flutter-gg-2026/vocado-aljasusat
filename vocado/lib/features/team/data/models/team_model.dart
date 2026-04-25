import 'package:vocado/features/team/domain/entities/team_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'team_model.freezed.dart';
part 'team_model.g.dart';

@freezed
abstract class TeamModel with _$TeamModel {
  const factory TeamModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _TeamModel;

  factory TeamModel.fromJson(Map<String, Object?> json) => _$TeamModelFromJson(json);
}



extension TeamModelMapper on TeamModel {
  TeamEntity toEntity() {
    return TeamEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }


class TeamMemberModel {
  final String name;
  final String role;
  final int tasks;
  final String status;

  TeamMemberModel({
    required this.name,
    required this.role,
    required this.tasks,
    required this.status,
  });
}