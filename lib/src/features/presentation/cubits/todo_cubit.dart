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
    loadTodos();
  }

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

  Future<Todo?> getTodo(int id) async {
    return await _todoRepository.getTodo(id);
  }

  Future<void> addTodo(Todo todo) async {
    await _todoRepository.addTodo(todo);
    _logger.info('Todo added: ${todo.name}');
    loadTodos();
  }

  Future<void> editTodo(Todo todo) async {
    await _todoRepository.editTodo(todo);
    _logger.info('Todo edited: ${todo.name}');
    loadTodos();
  }

  Future<void> deleteTodo(int id) async {
    await _todoRepository.deleteTodo(id);
    _logger.info('Todo deleted with id: $id');
    loadTodos();
  }

  Future<void> toggleCompletion(Todo todo) async {
    await _todoRepository.toggleCompletion(todo);
    _logger.info('Todo completion toggled for: ${todo.name}');
    loadTodos();
  }
}
