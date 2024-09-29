/* Widget that represents an individual Todo item in a list.

   It displays the todo name, its completion status and Deadline

   It includes functionality like toggling completion or deleting the todo. 
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Local imports
import 'package:todo_app/src/features/domain/todo_model.dart';
import 'package:todo_app/src/features/presentation/todo_cubit.dart';

class TodoListTile extends StatelessWidget {
  final Todo todo;

  const TodoListTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    // Access the TodoCubit from the current context
    final todoCubit = context.read<TodoCubit>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dismissible(
        // Dismissible allows the user to swipe the tile to delete the todo
        background: Container(color: Colors.red),
        key: ValueKey(todo.id),
        onDismissed: (direction) => todoCubit.deleteTodo(todo.id),
        child: ListTile(
          tileColor: Colors.grey.shade300,
          title: _buildTitle(todo),
          subtitle: todo.isCompleted ? null : _buildDeadline(todo.deadline),

          // Leading icon allows toggling the completion state
          leading: IconButton(
            icon: _getIcon(todo.isCompleted),
            onPressed: () => todoCubit.toggleCompletion(todo),
          ),
        ),
      ),
    );
  }

  /// Builds the title of the todo,
  /// and applies strikethrough if the todo is completed.
  Text _buildTitle(Todo todo) {
    return Text(
      todo.name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
      ),
    );
  }

  /// Returns the appropriate icon based on whether the todo is completed.
  /// [isCompleted] determines if the checkbox is filled or outlined.
  Icon _getIcon(bool isCompleted) {
    return Icon(
      isCompleted
          ? Icons.check_box_rounded
          : Icons.check_box_outline_blank_rounded,
    );
  }

  /// Displays the deadline of the todo as a subtitle.
  Text _buildDeadline(String deadline) {
    return Text('Deadline: $deadline');
  }
}
