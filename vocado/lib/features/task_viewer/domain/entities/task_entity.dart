import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final int id;
  final String title;
  final String date;
  final String status; 

  const TaskEntity({
    required this.id,
    required this.title,
    required this.date,
    required this.status,
  });

  @override
  List<Object?> get props => [id, title, date, status];
}