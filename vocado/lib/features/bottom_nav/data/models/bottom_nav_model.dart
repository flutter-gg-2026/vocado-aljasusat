import 'package:vocado/features/bottom_nav/domain/entities/bottom_nav_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'bottom_nav_model.freezed.dart';
part 'bottom_nav_model.g.dart';

@freezed
abstract class BottomNavModel with _$BottomNavModel {
  const factory BottomNavModel({
    required int id,
    required String firstName,
    required String lastName,
  }) = _BottomNavModel;

  factory BottomNavModel.fromJson(Map<String, Object?> json) =>
      _$BottomNavModelFromJson(json);
}

extension BottomNavModelMapper on BottomNavModel {
  BottomNavEntity toEntity() {
    return BottomNavEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }