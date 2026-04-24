import 'package:vocado/features/task_viewer/domain/entities/task_entity.dart';
import 'package:vocado/features/task_viewer/domain/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'task_viewer_model.freezed.dart';
part 'task_viewer_model.g.dart';

@freezed
abstract class TaskViewerModel with _$TaskViewerModel {
  const factory TaskViewerModel({
  required String userName,
    required int id,
    required String title,
    required String date,
    required String status,
  }) = _TaskViewerModel;

  factory TaskViewerModel.fromJson(Map<String, Object?> json) => _$TaskViewerModelFromJson(json);
}
extension TaskMapper on TaskViewerModel {
  TaskEntity toTaskEntity() {
    return TaskEntity(
      id: id,
      title: title,
      date: date,
      status: status,
    );
  }
}
extension UserMapper on TaskViewerModel {
  UserEntity toUserEntity() {
    return UserEntity(
      name: userName,
    );
  }
}