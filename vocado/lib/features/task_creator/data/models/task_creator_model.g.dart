// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_creator_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskCreatorModel _$TaskCreatorModelFromJson(Map<String, dynamic> json) =>
    _TaskCreatorModel(
      id: (json['id'] as num).toInt(),
      userId: json['user_id'] as String? ?? '',
      name: json['name'] as String? ?? 'Untitled',
      dueDate: json['due_date'] as String? ?? '',
      status: json['status'] as String? ?? 'Pending',
      assigneeName: json['assignee_name'] as String?,
      assignedBy: json['assigned_by'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$TaskCreatorModelToJson(_TaskCreatorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'due_date': instance.dueDate,
      'status': instance.status,
      'assignee_name': instance.assigneeName,
      'assigned_by': instance.assignedBy,
      'description': instance.description,
    };
