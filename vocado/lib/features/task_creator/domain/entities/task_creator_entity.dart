import 'package:equatable/equatable.dart';

class TaskCreatorEntity extends Equatable {
  final int id;
  final String userId;
  final String? name;
  final String? dueDate;
  final String status;
  final String? assignedBy;
  final String? description;
  final String? assigneeName;

  const TaskCreatorEntity({
    required this.id,
    required this.userId,
    this.name,
    this.dueDate,
    this.status = 'Pending',
    this.assignedBy,
    this.description, this.assigneeName,
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
    assigneeName
  ];
}
