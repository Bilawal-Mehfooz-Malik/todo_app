/*

Base class for data layer (For DataBase)

*/

import 'package:todo_app/src/features/domain/todo_model.dart';

abstract class TodoRepository {
  // Get All Todos
  Future<List<Todo>> getAllTodo();

  // Add Todo
  Future<void> addTodo(Todo todo);

  // Delete Todo
  Future<void> deleteTodo(String id);

  // Edit Todo
  Future<void> editTodo(Todo todo);
}
