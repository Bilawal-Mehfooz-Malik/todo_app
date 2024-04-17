import 'package:flutter/material.dart';

// local imports
import 'package:todo_app/src/constants/app_sizes.dart';
import 'package:todo_app/src/common/custom_textformfield.dart';
import 'package:todo_app/src/localization/string_hardcoded.dart';

class AddTaskTextFieldsSection extends StatefulWidget {
  const AddTaskTextFieldsSection({super.key});

  @override
  State<AddTaskTextFieldsSection> createState() =>
      _AddTaskTextFieldsSectionState();
}

class _AddTaskTextFieldsSectionState extends State<AddTaskTextFieldsSection> {
  final _formKey = GlobalKey<FormState>();
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
    return Form(
      key: _formKey,
      child: Column(
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
        ],
      ),
    );
  }
}
