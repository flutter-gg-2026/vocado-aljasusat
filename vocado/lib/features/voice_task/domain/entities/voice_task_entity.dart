class VoiceTaskEntity {
  final String title;
  final String description;
  final String assignedTo;
  final String assignedBy;
  final DateTime deadline;
  final String status;

  VoiceTaskEntity({
    required this.title,
    required this.description,
    required this.assignedTo,
    required this.assignedBy,
    required this.deadline,
    required this.status,
  });
}
