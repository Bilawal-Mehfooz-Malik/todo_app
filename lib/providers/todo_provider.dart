import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/priority_provider.dart';

final todoProvider =
    StateNotifierProvider<TodoNotifier, List<ToDo>>((ref) => TodoNotifier());

class TodoNotifier extends StateNotifier<List<ToDo>> {
  TodoNotifier() : super([]);

  void updateCheckBox(bool value, int index) {
    final List<ToDo> updatedTodos = List<ToDo>.from(state);
    updatedTodos[index].isCompleted = value;
    state = updatedTodos;
  }

  void saveTodo({
    required String task,
    required WidgetRef ref,
    required Priority priority,
    required BuildContext context,
  }) {
    if (task.trim().isEmpty) {
      errorDialog(
        'Empty Todo',
        'Please enter a task before saving!',
        context,
      );
      return;
    }
    final myTodo = ToDo(
      task: task,
      priority: priority,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
    );

    state = [...state, myTodo];
    ref.read(selectedPriorityProvider.notifier).changePriority(Priority.normal);
    Navigator.of(context).pop();
  }
}
