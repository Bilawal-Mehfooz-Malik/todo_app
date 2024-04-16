import 'package:flutter/material.dart';

// local imports
import 'package:todo_app/src/constants/app_sizes.dart';
import 'package:todo_app/src/common/alert_dialogues.dart';
import 'package:todo_app/src/common/custom_elevated_button.dart';
import 'package:todo_app/src/features/add_tasks/presentation/priority_radio_section.dart';
import 'package:todo_app/src/features/add_tasks/presentation/add_task_textfield_section.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Todo')),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.p8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Task title and description fields
            const AddTaskTextFieldsSection(),

            // Priority Section ([Priority.urgent], [Priority.normal])
            const PriorityRadioSection(),
            const Spacer(),

            // Save Todo Button
            CustomElevatedButton(
              text: 'Save',
              onPressed: () => _saveTodo(context),
            ),
            gapH4,
          ],
        ),
      ),
    );
  }

  void _saveTodo(BuildContext context) {
    // TODO: Implement save method
    showNotImplementedAlertDialog(context: context);
  }
}
