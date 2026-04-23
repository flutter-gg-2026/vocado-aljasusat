import 'package:equatable/equatable.dart';

abstract class SignState extends Equatable {
  const SignState();

  @override
  List<Object?> get props => [];
}

class SignInitialState extends SignState {}
class SignSuccessState extends SignState {}

class SignErrorState extends SignState {
  final String message;
  const SignErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

