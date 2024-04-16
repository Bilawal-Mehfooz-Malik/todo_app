import 'package:flutter/material.dart';

// local imports
import 'package:todo_app/src/constants/test_tasks.dart';
import 'package:todo_app/src/features/my_tasks/presentation/task_list_tile.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kTestTasks.length,
      itemBuilder: (context, index) {
        // TODO: fetch task from data
        final task = kTestTasks[index];
        return TaskListTile(task: task);
      },
    );
  }
}
