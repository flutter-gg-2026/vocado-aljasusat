import 'package:equatable/equatable.dart';

abstract class TeamState extends Equatable {
  const TeamState();

  @override
  List<Object?> get props => [];
}

class TeamInitialState extends TeamState {}
class TeamSuccessState extends TeamState {}

class TeamErrorState extends TeamState {
  final String message;
  const TeamErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

