import 'package:flutter/material.dart';
import 'package:todo_app/src/constants/app_sizes.dart';
import 'package:todo_app/src/common/alert_dialogues.dart';
import 'package:todo_app/src/localization/string_hardcoded.dart';
import 'package:todo_app/src/common/custom_elevated_button.dart';
import 'package:todo_app/src/features/add_tasks/add_task_textfield_section.dart';

class AddTaskBody extends StatelessWidget {
  const AddTaskBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Task title and description fields
        const AddTaskTextFieldsSection(),

        // Save Todo Button
        CustomElevatedButton(
          text: 'Save'.hardcoded,
          onPressed: () => _saveTodo(context),
        ),
        gapH4,
      ],
    );
  }

  void _saveTodo(BuildContext context) {
    // TODO: Implement save method
    showNotImplementedAlertDialog(context: context);
  }
}
