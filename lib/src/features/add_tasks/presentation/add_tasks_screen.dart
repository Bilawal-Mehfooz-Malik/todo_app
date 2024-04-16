import 'package:flutter/material.dart';
import 'package:todo_app/src/features/add_tasks/presentation/add_task_content.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Todo')),
      body: const AddTaskContent(),
    );
  }
}
