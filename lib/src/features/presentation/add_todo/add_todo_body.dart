import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// local imports
import 'package:todo_app/src/utils/extensions.dart';
import 'package:todo_app/src/constants/app_sizes.dart';
import 'package:todo_app/src/common/custom_text_field.dart';
import 'package:todo_app/src/features/domain/todo_model.dart';
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
          label: context.loc.title,
          controller: _titleController,
        ),
        gapH8,
        CustomTextField(
          maxLines: 8,
          maxLength: 1000,
          hintText: context.loc.description,
          controller: _descriptionController,
        ),
        gapH16,

        // Save Todo Button
        CustomElevatedButton(
          text: context.loc.save,
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

      await context.read<TodoCubit>().addTodo(todo);

      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } else {
      print('Title or description is empty');
    }
  }
}
