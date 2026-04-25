import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String id;
  final String email;
  final String role;

  const LoginEntity({
    required this.id,
    required this.email,
    required this.role,
  });

  @override
  List<Object?> get props => [id, email];
}
