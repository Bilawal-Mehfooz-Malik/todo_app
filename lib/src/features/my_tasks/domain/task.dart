enum Priority { urgent, normal }

class Task {
  final String id;
  final String taskName;
  final String taskDescription;
  final Priority priority;
  final String deadline;
  final bool isDone;

  Task({
    required this.id,
    required this.taskName,
    required this.taskDescription,
    this.priority = Priority.normal,
    this.isDone = false,
    required this.deadline,
  });
}
