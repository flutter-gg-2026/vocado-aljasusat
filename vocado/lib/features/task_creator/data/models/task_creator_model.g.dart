// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_creator_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskCreatorModel _$TaskCreatorModelFromJson(Map<String, dynamic> json) =>
    _TaskCreatorModel(
      id: (json['id'] as num).toInt(),
      userId: json['userId'] as String,
      name: json['name'] as String,
      dueDate: json['dueDate'] as String,
      status: json['status'] as String? ?? 'Pending',
      assigneeName: json['assigneeName'] as String?,
      assignedBy: json['assignedBy'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$TaskCreatorModelToJson(_TaskCreatorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'dueDate': instance.dueDate,
      'status': instance.status,
      'assigneeName': instance.assigneeName,
      'assignedBy': instance.assignedBy,
      'description': instance.description,
    };
