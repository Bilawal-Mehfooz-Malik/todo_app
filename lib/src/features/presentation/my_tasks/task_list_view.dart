import 'package:flutter/material.dart';

// local imports
import 'package:todo_app/src/features/domain/todo_model.dart';
import 'package:todo_app/src/features/presentation/my_tasks/task_list_tile.dart';

class TaskListView extends StatelessWidget {
  final List<Todo> tasks;
  const TaskListView({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    // converting list of tasks into list of widget
    // to pass it into column
    final tasksList = List.generate(
      tasks.length,
      (index) => TaskListTile(task: tasks[index]),
    );
    return Column(children: tasksList);
  }
}
