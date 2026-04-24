import 'package:vocado/features/task_viewer/sub/task_filter/domain/entities/task_filter_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'task_filter_model.freezed.dart';
part 'task_filter_model.g.dart';

@freezed
abstract class TaskFilterModel with _$TaskFilterModel {
  const factory TaskFilterModel({
    required int id,
    required String title,
    required String description,
    required String assignedBy,
    required DateTime deadline,
    required String status,
  }) = _TaskFilterModel;

  factory TaskFilterModel.fromJson(Map<String, Object?> json) =>
      _$TaskFilterModelFromJson(json);
}


extension TaskFilterModelMapper on TaskFilterModel {
  TaskFilterEntity toEntity() {
    return TaskFilterEntity(
      id: id,
      title: title,
      description: description,
      assignedBy: assignedBy,
      deadline: deadline,
      status: status,
    );
  }
}