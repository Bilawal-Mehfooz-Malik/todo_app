import 'package:flutter/material.dart';
import 'package:todo_app/data/todo_data.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key, required this.priority});
  final Priority priority;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);
    final filteredTodos = todos.where((e) => e.priority == priority).toList();

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (ctx, index) {
        final todo = filteredTodos[index];
        return CheckboxListTile(
          value: todo.isCompleted,
          onChanged: (value) {
            ref.read(todoProvider.notifier).updateCheckBox(value!, index);
          },
          title: Text(todo.task),
          subtitle: Text('Priority: ${todo.priority.name}'),
        );
      },
    );
  }
}
