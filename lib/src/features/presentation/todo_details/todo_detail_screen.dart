import 'package:flutter/material.dart';
import 'package:todo_app/src/features/domain/todo_model.dart';
import 'package:todo_app/src/features/presentation/add_tasks/add_todo_screen.dart';
import 'package:todo_app/src/localization/string_hardcoded.dart';

class TodoDetailScreen extends StatelessWidget {
  final Todo todo;

  const TodoDetailScreen({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailItem('Title', todo.name),
            const SizedBox(height: 8),
            _buildDetailItem('Description', todo.description),
            const SizedBox(height: 8),
            _buildDetailItem('Deadline', todo.deadline),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext ctx) {
    return AppBar(
      title: Text('Todo Details'.hardcoded),
      actions: [
        IconButton(
          onPressed: () => _navigate(ctx),
          icon: const Icon(Icons.edit),
        ),
      ],
    );
  }

  void _navigate(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => AddTodoScreen(),
    ));
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
