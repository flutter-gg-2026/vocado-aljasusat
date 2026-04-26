import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/task_entity.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
abstract class TaskModel with _$TaskModel {
  const factory TaskModel({
    required int id,
    required String title,
    required String description,
    required String assignedBy,
    required DateTime deadline,
    required String status,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}

extension TaskMapper on TaskModel {
  TaskEntity toEntity() {
    return TaskEntity(
      id: id,
      title: title,
      description: description,
      assignedBy: assignedBy,
      deadline: deadline,
      status: status,
    );
  }
}