import 'package:vocado/features/auth/sub/sign/domain/entities/sign_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_model.freezed.dart';
part 'sign_model.g.dart';

@freezed
abstract class SignModel with _$SignModel {
  const factory SignModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _SignModel;

  factory SignModel.fromJson(Map<String, Object?> json) => _$SignModelFromJson(json);
}



extension SignModelMapper on SignModel {
  SignEntity toEntity() {
    return SignEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
