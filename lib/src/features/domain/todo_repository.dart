/*

Base class for data layer (For DataBase)

*/

import 'package:todo_app/src/features/domain/todo_model.dart';

abstract class TodoRepository {
  // Get All Todos
  Future<List<Todo>> getAllTodo();

  // Get single Todo
  Future<Todo?> getTodo(int id);
  // Add Todo
  Future<void> addTodo(Todo todo);

  // Delete Todo
  Future<void> deleteTodo(int id);

  // Edit Todo
  Future<void> editTodo(Todo todo);

  // complete
  Future<void> toggleCompletion(Todo todo);
}
