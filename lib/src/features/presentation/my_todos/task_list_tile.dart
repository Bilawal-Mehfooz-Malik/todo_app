/* Widget that represents an individual Todo item in a list.

   It displays the todo name, its completion status and Deadline

   It includes functionality like toggling completion or deleting the todo. 
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/common/alert_dialogues.dart';
import 'package:todo_app/src/localization/string_hardcoded.dart';

// Local imports
import 'package:todo_app/src/utils/extensions.dart';
import 'package:todo_app/src/features/domain/todo_model.dart';
import 'package:todo_app/src/features/presentation/todo_cubit.dart';

class TodoListTile extends StatelessWidget {
  final Todo todo;

  const TodoListTile({super.key, required this.todo});

  void onDismissed(BuildContext context, TodoCubit todoCubit) async {
    final result = await showAlertDialog(
      context: context,
      title: 'Todo Delete!'.hardcoded,
      content: 'Are you sure you want to delete this todo',
      cancelActionText: 'Cancel',
      defaultActionText: 'Delete',
    );

    if (result == true) {
      todoCubit.deleteTodo(todo.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Access the TodoCubit from the current context
    final todoCubit = context.read<TodoCubit>();

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Dismissible(
        // Dismissible allows the user to swipe the tile to delete the todo
        background: Container(color: context.color.error),
        key: ValueKey(todo.id),
        onDismissed: (direction) => onDismissed(context, todoCubit),
        child: ListTile(
            title: _buildTitle(todo),
            subtitle: todo.isCompleted
                ? null
                : _buildDeadline(todo.deadline, context),

            // Leading icon allows toggling the completion state
            leading: _buildCheckBox(todo, todoCubit)),
      ),
    );
  }

  /// Builds the title of the todo,
  /// and applies strikethrough if the todo is completed.
  Text _buildTitle(Todo todo) {
    return Text(
      todo.name,
      style: TextStyle(
        decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
      ),
    );
  }

  Checkbox _buildCheckBox(Todo todo, TodoCubit cubit) {
    return Checkbox(
        value: todo.isCompleted,
        onChanged: (value) => cubit.toggleCompletion(todo));
  }

  /// Displays the deadline of the todo as a subtitle.
  Text _buildDeadline(String deadline, BuildContext context) {
    return Text('${context.loc.deadline} $deadline');
  }
}
