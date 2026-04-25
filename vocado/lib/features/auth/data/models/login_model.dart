import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocado/features/auth/domain/entities/login_entity.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
abstract class LoginModel with _$LoginModel {
  const factory LoginModel({
    required String id,
    required String email,
    required String role,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}

extension LoginModelMapper on LoginModel {
  LoginEntity toEntity() {
    return LoginEntity(
      id: id,
      email: email,
      role: role,
    );
  }
}