class Todo {
  final int id;
  final String name;
  final String description;
  final String deadline;
  final bool isCompleted;

  Todo({
    required this.id,
    required this.name,
    required this.description,
    this.isCompleted = false,
    required this.deadline,
  });

  Todo toggleCompletion(Todo todo) {
    return Todo(
      id: id,
      name: name,
      description: description,
      isCompleted: !isCompleted,
      deadline: deadline,
    );
  }
}
