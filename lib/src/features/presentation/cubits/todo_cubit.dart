import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/features/domain/todo_model.dart';
import 'package:todo_app/src/features/domain/todo_repository.dart';
import 'package:todo_app/src/features/presentation/cubits/todo_state.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/src/utils/app_logger.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepository _todoRepository;
  final Logger _logger = GetIt.instance<Logger>();

  TodoCubit(this._todoRepository) : super(TodoInitial()) {
    _logger.info('TodoCubit initialized');
  }

  /// Loads all todos
  Future<void> loadTodos() async {
    emit(TodoLoading());
    try {
      final todos = await _todoRepository.getAllTodo();
      _logger.info('Todos loaded successfully');
      emit(TodoLoaded(todos));
    } catch (e, s) {
      _logger.severe('Failed to load todos', error: e, stackTrace: s);
      emit(TodoError(e.toString()));
    }
  }

  /// Returns a single todo
  Future<Todo?> getTodo(int id) async {
    return await _todoRepository.getTodo(id);
  }

  /// Adds a new todo, then reloads list
  Future<void> addTodo(Todo todo) async {
    try {
      await _todoRepository.addTodo(todo);
      _logger.info('Todo added: ${todo.name}');
      await loadTodos();
    } catch (e, s) {
      _logger.severe('Failed to add todo', error: e, stackTrace: s);
      emit(TodoError(e.toString()));
    }
  }

  /// Edits an existing todo, then reloads list
  Future<void> editTodo(Todo todo) async {
    try {
      await _todoRepository.editTodo(todo);
      _logger.info('Todo edited: ${todo.name}');
      await loadTodos();
    } catch (e, s) {
      _logger.severe('Failed to edit todo', error: e, stackTrace: s);
      emit(TodoError(e.toString()));
    }
  }

  /// Deletes a todo by ID, then reloads list
  Future<void> deleteTodo(int id) async {
    try {
      await _todoRepository.deleteTodo(id);
      _logger.info('Todo deleted with id: $id');
      await loadTodos();
    } catch (e, s) {
      _logger.severe('Failed to delete todo', error: e, stackTrace: s);
      emit(TodoError(e.toString()));
    }
  }

  /// Toggles completion, then reloads list
  Future<void> toggleCompletion(Todo todo) async {
    try {
      await _todoRepository.toggleCompletion(todo);
      _logger.info('Todo completion toggled for: ${todo.name}');
      await loadTodos();
    } catch (e, s) {
      _logger.severe('Failed to toggle completion', error: e, stackTrace: s);
      emit(TodoError(e.toString()));
    }
  }
}
