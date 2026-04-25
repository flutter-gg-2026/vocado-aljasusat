// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VoiceTaskModel _$VoiceTaskModelFromJson(Map<String, dynamic> json) =>
    _VoiceTaskModel(
      title: json['title'] as String,
      description: json['description'] as String,
      assignedTo: json['assigned_to'] as String,
      assignedBy: json['assigned_by'] as String,
      deadline: DateTime.parse(json['deadline'] as String),
      status: json['status'] as String,
    );

Map<String, dynamic> _$VoiceTaskModelToJson(_VoiceTaskModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'assigned_to': instance.assignedTo,
      'assigned_by': instance.assignedBy,
      'deadline': instance.deadline.toIso8601String(),
      'status': instance.status,
    };
