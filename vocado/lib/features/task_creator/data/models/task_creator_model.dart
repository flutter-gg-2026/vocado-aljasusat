import 'package:vocado/features/task_creator/domain/entities/task_creator_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'task_creator_model.freezed.dart';
part 'task_creator_model.g.dart';

@freezed
abstract class TaskCreatorModel with _$TaskCreatorModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TaskCreatorModel({
    required int id,
    required String userId,
    required String name,
    required String dueDate,
    required String status,
    String? assigneeName,
    String? assignedBy,
    String? description,
  }) = _TaskCreatorModel;

  factory TaskCreatorModel.fromJson(Map<String, dynamic> json) =>
      _$TaskCreatorModelFromJson(json);
}

extension TaskCreatorModelMapper on TaskCreatorModel {
  TaskCreatorEntity toEntity() {
    return TaskCreatorEntity(
      id: id,
      userId: userId,
      name: name,
      dueDate: dueDate,
      status: status,
      assignedBy: assignedBy,
      description: description,
      assigneeName: assigneeName,
    );
  }
}
