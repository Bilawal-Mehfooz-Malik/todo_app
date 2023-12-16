import 'package:flutter/material.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (ctx, index) {
          final todo = todos[index];
          return CheckboxListTile(
            value: todo.isCompleted,
            onChanged: (value) {
              ref.watch(todoProvider.notifier).updateCheckBox(value!, index);
            },
            title: Text(todo.task),
            subtitle: Text('Priority: ${todo.priority.name}'),
          );
        });
  }
}
