import 'package:flutter/material.dart';

// local imports
import 'package:todo_app/src/common/alert_dialogues.dart';
import 'package:todo_app/src/features/domain/todo_model.dart';

class TaskListTile extends StatelessWidget {
  final Todo task;
  const TaskListTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            task.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('Deadline: ${task.deadline}'),
          trailing: IconButton(
            onPressed: () => _markComplete(context),
            icon: const Icon(Icons.check_box_outline_blank_rounded),
          ),
        ),
      ),
    );
  }

  void _markComplete(BuildContext context) {
    // TODO: add task complete functionality
    showNotImplementedAlertDialog(context: context);
  }
}
