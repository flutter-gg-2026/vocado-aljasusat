// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_viewer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskViewerModel _$TaskViewerModelFromJson(Map<String, dynamic> json) =>
    _TaskViewerModel(
      userName: json['userName'] as String,
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      date: json['date'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$TaskViewerModelToJson(_TaskViewerModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'id': instance.id,
      'title': instance.title,
      'date': instance.date,
      'status': instance.status,
    };
