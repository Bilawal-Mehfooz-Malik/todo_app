import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/features/domain/todo_model.dart';
import 'package:todo_app/src/features/domain/todo_repository.dart';
import 'package:todo_app/src/features/presentation/cubits/todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepository _todoRepository;
  TodoCubit(this._todoRepository) : super(TodoInitial()) {
    loadTodos();
  }

  Future<void> loadTodos() async {
    emit(TodoLoading());
    try {
      final todos = await _todoRepository.getAllTodo();
      emit(TodoLoaded(todos));
    } catch (e) {
      TodoError(e.toString());
    }
  }

  Future<Todo?> getTodo(int id) async {
    return await _todoRepository.getTodo(id);
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

  Future<void> toggleCompletion(Todo todo) async {
    await _todoRepository.toggleCompletion(todo);
    loadTodos();
  }
}
