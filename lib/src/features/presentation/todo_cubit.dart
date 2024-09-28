import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/features/domain/todo_model.dart';
import 'package:todo_app/src/features/domain/todo_repository.dart';

class TodoCubit extends Cubit<List<Todo>> {
  final TodoRepository _todoRepository;
  TodoCubit(this._todoRepository) : super([]) {
    loadTodos();
  }

  Future<void> loadTodos() async {
    final todos = await _todoRepository.getAllTodo();
    emit(todos);
  }

  Future<void> addTodo(Todo todo) async {
    await _todoRepository.addTodo(todo);
    loadTodos();
  }

  Future<void> editTodo(Todo todo) async {
    await _todoRepository.editTodo(todo);
    loadTodos();
  }

  Future<void> deleteTodo(int id) async {
    await _todoRepository.deleteTodo(id);
    loadTodos();
  }
}
