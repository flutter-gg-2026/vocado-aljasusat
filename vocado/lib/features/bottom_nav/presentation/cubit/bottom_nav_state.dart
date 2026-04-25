import 'package:equatable/equatable.dart';

abstract class BottomNavState extends Equatable {
  const BottomNavState();

  @override
  List<Object?> get props => [];
}

class BottomNavInitialState extends BottomNavState {}

class BottomNavSuccessState extends BottomNavState {}

class BottomNavChangedState extends BottomNavState {
  final int index;
  const BottomNavChangedState(this.index);
  @override
  List<Object?> get props => [index];
}

class BottomNavLoadingState extends BottomNavState {}

class BottomNavErrorState extends BottomNavState {
  final String message;
  const BottomNavErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
