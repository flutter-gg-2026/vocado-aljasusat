// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskFilterModel _$TaskFilterModelFromJson(Map<String, dynamic> json) =>
    _TaskFilterModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      assignedBy: json['assignedBy'] as String,
      deadline: DateTime.parse(json['deadline'] as String),
      status: json['status'] as String,
    );

Map<String, dynamic> _$TaskFilterModelToJson(_TaskFilterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'assignedBy': instance.assignedBy,
      'deadline': instance.deadline.toIso8601String(),
      'status': instance.status,
    };
