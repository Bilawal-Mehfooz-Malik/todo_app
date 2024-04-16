import 'package:flutter/material.dart';

// local imports
import 'package:todo_app/src/constants/app_sizes.dart';
import 'package:todo_app/src/common/alert_dialogues.dart';
import 'package:todo_app/src/common/custom_elevated_button.dart';
import 'package:todo_app/src/features/add_tasks/presentation/priority_radio_section.dart';
import 'package:todo_app/src/features/add_tasks/presentation/add_task_textfield_section.dart';

class AddTaskContent extends StatelessWidget {
  const AddTaskContent({super.key});

  @override
  Widget build(BuildContext context) {
    // final style = Theme.of(context);
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.p8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AddTaskTextFieldsSection(),

            // Priority Section
            const PriorityRadioSection(),
            const Spacer(),

            // Save Todo Button
            CustomElevatedButton(
              text: 'Save',
              onPressed: () {
                // TODO: Implement save method
                showNotImplementedAlertDialog(context: context);
              },
            ),
            gapH4,
          ],
        ),
      ),
    );
  }
}
