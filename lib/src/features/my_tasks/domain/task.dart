class Task {
  final String id;
  final String taskName;
  final String taskDescription;
  final String deadline;
  final bool isDone;

  Task({
    required this.id,
    required this.taskName,
    required this.taskDescription,
    this.isDone = false,
    required this.deadline,
  });
}
