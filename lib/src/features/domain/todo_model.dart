import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final int id;
  final String name;
  final String description;
  final DateTime deadline;
  final bool isCompleted;

  const Todo({
    required this.id,
    required this.name,
    required this.description,
    required this.deadline,
    this.isCompleted = false,
  });

  Todo toggleCompletion() {
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

  @override
  List<Object?> get props => [id, name, description, deadline, isCompleted];
}
