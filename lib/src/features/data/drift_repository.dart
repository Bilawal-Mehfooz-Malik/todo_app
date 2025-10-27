import 'package:drift/drift.dart';
import 'package:todo_app/src/features/data/database/app_database.dart';
import 'package:todo_app/src/features/domain/todo_model.dart';
import 'package:todo_app/src/features/domain/todo_repository.dart';

class DriftRepository implements TodoRepository {
  DriftRepository(this._db);

  final AppDatabase _db;

  @override
  Future<void> addTodo(Todo todo) async {
    await _db.into(_db.todos).insert(_toInsertableTodosCompanion(todo));
  }

  @override
  Future<void> deleteTodo(int id) async {
    await (_db.delete(_db.todos)..where((t) => t.id.equals(id))).go();
  }

  @override
  Future<void> editTodo(Todo todo) async {
    await (_db.update(_db.todos)..where((t) => t.id.equals(todo.id))).write(
      _toUpdateableTodosCompanion(todo),
    );
  }

  @override
  Future<List<Todo>> getAllTodo() async {
    final allEntries = await _db.select(_db.todos).get();
    return allEntries.map(_toTodoModel).toList();
  }

  @override
  Future<void> toggleCompletion(Todo todo) async {
    final updatedTodo = todo.copyWith(isCompleted: !todo.isCompleted);
    await editTodo(updatedTodo);
  }

  @override
  Future<Todo?> getTodo(int id) async {
    final entry = await (_db.select(
      _db.todos,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    return entry != null ? _toTodoModel(entry) : null;
  }

  // Helper to convert TodoModel to TodosCompanion for updates (id is present)
  TodosCompanion _toUpdateableTodosCompanion(Todo todo) {
    return TodosCompanion(
      id: Value(todo.id),
      name: Value(todo.name),
      description: Value(todo.description),
      deadline: Value(todo.deadline),
      isCompleted: Value(todo.isCompleted),
    );
  }

  // Helper to convert TodoModel to TodosCompanion for inserts (id is absent, letting DB auto-increment)
  TodosCompanion _toInsertableTodosCompanion(Todo todo) {
    return TodosCompanion(
      name: Value(todo.name),
      description: Value(todo.description),
      deadline: Value(todo.deadline),
      isCompleted: Value(todo.isCompleted),
    );
  }

  // Helper to convert TodoEntry (Drift's generated data class) to TodoModel
  Todo _toTodoModel(TodoEntry entry) {
    return Todo(
      id: entry.id,
      name: entry.name,
      description: entry.description ?? '', // description is nullable in DB
      deadline: entry.deadline,
      isCompleted: entry.isCompleted,
    );
  }
}
