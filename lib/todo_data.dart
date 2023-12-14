enum Priority { low, normal, high }

class ToDo {
  final String id;
  final String task;
  final bool isCompleted;
  final Priority priority;

  ToDo({
    required this.id,
    required this.task,
    required this.priority,
    this.isCompleted = false,
  });

  static List<ToDo> myTodos = [];
}
