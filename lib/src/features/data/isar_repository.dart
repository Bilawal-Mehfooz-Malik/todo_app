import 'package:isar/isar.dart';
import 'package:todo_app/src/features/data/isar_todo.dart';
import 'package:todo_app/src/features/domain/todo_model.dart';
import 'package:todo_app/src/features/domain/todo_repository.dart';

class IsarRepository implements TodoRepository {
  IsarRepository(this._db);

  final Isar _db;

  @override
  Future<void> addTodo(Todo todo) async {
    final isarTodo = IsarTodo().fromDomain(todo);
    await _db.writeTxn(() => _db.isarTodos.put(isarTodo));
  }

  @override
  Future<void> deleteTodo(int id) async {
    await _db.writeTxn(() => _db.isarTodos.delete(id));
  }

  @override
  Future<void> editTodo(Todo todo) async {
    final isarTodo = IsarTodo().fromDomain(todo);
    await _db.writeTxn(() => _db.isarTodos.put(isarTodo));
  }

  @override
  Future<List<Todo>> getAllTodo() async {
    final todos = await _db.isarTodos.where().findAll();
    return todos.map((isarTodo) => isarTodo.toDomain()).toList();
  }
}
