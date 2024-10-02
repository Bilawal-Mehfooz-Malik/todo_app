class Todo {
  final int id;
  final String name;
  final String description;
  final DateTime deadline;
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

  Todo copyWith({
    int? id,
    String? name,
    String? description,
    DateTime? deadline,
    bool? isCompleted,
  }) {
    return Todo(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      deadline: deadline ?? this.deadline,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
