import 'package:flutter/material.dart';

// local imports
import 'package:todo_app/src/constants/app_sizes.dart';
import 'package:todo_app/src/common/custom_textformfield.dart';
import 'package:todo_app/src/localization/string_hardcoded.dart';

class AddTaskContent extends StatefulWidget {
  const AddTaskContent({super.key});

  @override
  State<AddTaskContent> createState() => _AddTaskContentState();
}

class _AddTaskContentState extends State<AddTaskContent> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.p8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormField(
              label: 'Title'.hardcoded,
              controller: _titleController,
            ),
            gapH8,

            CustomTextFormField(
              label: 'Description'.hardcoded,
              controller: _descriptionController,
            ),
            gapH16,

            // Priority Section
            Text(
              'Choose the priority of your work',
              style: style.textTheme.titleMedium,
            ),
            // Row(
            //   children: [
            //     RadioListTile(
            //       value: value,
            //       groupValue: groupValue,
            //       onChanged: onChanged,
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
