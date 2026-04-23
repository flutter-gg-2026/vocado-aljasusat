import 'package:vocado/features/auth/sub/login/domain/entities/login_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
abstract class LoginModel with _$LoginModel {
  const factory LoginModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, Object?> json) => _$LoginModelFromJson(json);
}



extension LoginModelMapper on LoginModel {
  LoginEntity toEntity() {
    return LoginEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
