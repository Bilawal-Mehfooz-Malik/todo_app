import 'package:todo_app/src/features/domain/todo_model.dart';

abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Todo> todos;

  TodoLoaded(this.todos);
}

class TodoError extends TodoState {
  final String message;

  TodoError(this.message);
}