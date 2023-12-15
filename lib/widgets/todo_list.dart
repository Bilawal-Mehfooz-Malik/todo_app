import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo_data.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key, required this.onChanged});

  final void Function(bool, int) onChanged;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: ToDo.myTodos.length,
        itemBuilder: (ctx, index) {
          final todo = ToDo.myTodos[index];
          return CheckboxListTile(
            value: todo.isCompleted,
            onChanged: (value) {
              onChanged(value!, index);
            },
            title: Text(todo.task),
            subtitle: Text('Priority: ${todo.priority.name}'),
          );
        });
  }
}
