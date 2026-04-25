class TaskEntity {
  final int id;
  final String title;
  final String description;
  final String assignedBy;
  final DateTime deadline;
  final String status;

  TaskEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.assignedBy,
    required this.deadline,
    required this.status,
  });

  String get deadlineFormatted =>
      "${deadline.day}/${deadline.month}/${deadline.year}";
}
