// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_nav_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BottomNavModel _$BottomNavModelFromJson(Map<String, dynamic> json) =>
    _BottomNavModel(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$BottomNavModelToJson(_BottomNavModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
