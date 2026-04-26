import 'package:vocado/features/voice_task/domain/entities/voice_task_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'voice_task_model.freezed.dart';
part 'voice_task_model.g.dart';

@freezed
abstract class VoiceTaskModel with _$VoiceTaskModel {
  const factory VoiceTaskModel({
    required String title,
    required String description,
    @JsonKey(name: 'assigned_to') required String assignedTo,
    @JsonKey(name: 'assigned_by') required String assignedBy,
    required DateTime deadline,
    required String status,
  }) = _VoiceTaskModel;

  factory VoiceTaskModel.fromJson(Map<String, dynamic> json) =>
      _$VoiceTaskModelFromJson(json);
}

extension VoiceTaskMapper on VoiceTaskModel {
  VoiceTaskEntity toEntity() {
    return VoiceTaskEntity(
      title: title,
      description: description,
      assignedTo: assignedTo,
      assignedBy: assignedBy,
      deadline: deadline,
      status: status,
    );
  }
}

extension VoiceTaskEntityMapper on VoiceTaskEntity {
  VoiceTaskModel toModel() {
    return VoiceTaskModel(
      title: title,
      description: description,
      assignedTo: assignedTo,
      assignedBy: assignedBy,
      deadline: deadline,
      status: status,
    );
  }
}
