import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/constants/app_sizes.dart';
import 'package:todo_app/src/common/custom_text_field.dart';
import 'package:todo_app/src/features/domain/todo_model.dart';
import 'package:todo_app/src/localization/string_hardcoded.dart';
import 'package:todo_app/src/common/custom_elevated_button.dart';
import 'package:todo_app/src/features/presentation/todo_cubit.dart';

class AddTodoBody extends StatefulWidget {
  const AddTodoBody({super.key});

  @override
  State<AddTodoBody> createState() => _AddTodoBodyState();
}

class _AddTodoBodyState extends State<AddTodoBody> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomTextField(
          label: 'Title'.hardcoded,
          controller: _titleController,
        ),
        gapH8,
        CustomTextField(
          maxLines: 8,
          maxLength: 1000,
          hintText: 'Description'.hardcoded,
          controller: _descriptionController,
        ),
        gapH16,

        // Save Todo Button
        CustomElevatedButton(
          text: 'Save'.hardcoded,
          onPressed: () => _saveTodo(context),
        ),
        gapH4,
      ],
    );
  }

  void _saveTodo(BuildContext context) async {
    if (_titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      final title = _titleController.text;
      final detail = _descriptionController.text;

      // Create a new Todo
      Todo todo = Todo(
        id: DateTime.now().millisecondsSinceEpoch,
        name: title,
        description: detail,
        deadline: '1-01-2022',
      );

      // Log for debugging
      print('Adding todo: $title, $detail');

      // Call addTodo from the TodoCubit
      await context.read<TodoCubit>().addTodo(todo);

      // Log if addition was successful
      print('Todo added successfully');

      // Navigate back if the widget is still mounted
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } else {
      print('Title or description is empty');
    }
  }
}
