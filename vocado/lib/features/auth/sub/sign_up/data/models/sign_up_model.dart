import 'package:vocado/features/auth/sub/sign_up/domain/entities/sign_up_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_model.freezed.dart';
part 'sign_up_model.g.dart';

@freezed
abstract class SignUpModel with _$SignUpModel {
  const factory SignUpModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _SignUpModel;

  factory SignUpModel.fromJson(Map<String, Object?> json) => _$SignUpModelFromJson(json);
}



extension SignUpModelMapper on SignUpModel {
  SignUpEntity toEntity() {
    return SignUpEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
