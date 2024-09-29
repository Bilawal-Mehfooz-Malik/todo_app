import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// local imports
import 'package:todo_app/src/features/domain/todo_model.dart';
import 'package:todo_app/src/features/presentation/todo_cubit.dart';

class TodoListTile extends StatelessWidget {
  final Todo todo;
  const TodoListTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            todo.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('Deadline: ${todo.deadline}'),
          trailing: IconButton(
            icon: const Icon(Icons.check_box_outline_blank_rounded),
            onPressed: () => context.read<TodoCubit>().toggleCompletion(todo),
          ),
        ),
      ),
    );
  }
}
