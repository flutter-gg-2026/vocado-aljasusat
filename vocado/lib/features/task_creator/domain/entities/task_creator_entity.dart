import 'package:equatable/equatable.dart';

class TaskCreatorEntity extends Equatable {
  final int id;
  final String userId;
  final String name;
  final String dueDate;
  final String status;
  final String? assignedBy;
  final String? description;

  const TaskCreatorEntity({
    required this.id,
    required this.userId,
    required this.name,
    required this.dueDate,
    required this.status,
    this.assignedBy,
    this.description,
  });

  @override
  List<Object?> get props => [
    id,
    userId,
    name,
    dueDate,
    status,
    assignedBy,
    description,
  ];
}
