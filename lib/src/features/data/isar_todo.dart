import 'package:isar/isar.dart';
import 'package:todo_app/src/features/domain/todo_model.dart';

// to generate isar todo: run-> dart run build_runner build
part 'isar_todo.g.dart';

@collection
class IsarTodo {
  Id id = Isar.autoIncrement;
  late String name;
  late String description;
  late DateTime deadline;
  late bool isCompleted;

  Todo toDomain() {
    return Todo(
      id: id,
      name: name,
      description: description,
      deadline: deadline,
      isCompleted: isCompleted,
    );
  }

  IsarTodo fromDomain(Todo todo) {
    return IsarTodo()
      ..id = todo.id
      ..name = todo.name
      ..description = todo.description
      ..isCompleted = todo.isCompleted
      ..deadline = todo.deadline;
  }
}
