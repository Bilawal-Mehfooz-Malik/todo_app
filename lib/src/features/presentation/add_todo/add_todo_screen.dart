import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/common/alert_dialogues.dart';
import 'package:todo_app/src/utils/extensions.dart';
import 'package:todo_app/src/constants/app_sizes.dart';
import 'package:todo_app/src/common/custom_text_field.dart';
import 'package:todo_app/src/features/domain/todo_model.dart';
import 'package:todo_app/src/common/custom_elevated_button.dart';
import 'package:todo_app/src/features/presentation/todo_cubit.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key, this.todo});

  final Todo? todo;

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.todo != null) {
      _titleController.text = widget.todo!.name;
      _descriptionController.text = widget.todo!.description;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.todo == null ? context.loc.addTodo : context.loc.editTodo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.p12),
        child: SingleChildScrollView(
          child: Column(
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
          ),
        ),
      ),
    );
  }

  void _saveTodo(BuildContext context) async {
    final title = _titleController.text;
    final detail = _descriptionController.text;

    // Check for empty fields
    if (title.isEmpty || detail.isEmpty) {
      showExceptionAlertDialog(
          context: context, exception: context.loc.emptyTitleDesc);
      return;
    }

    if (widget.todo != null) {
      // Edit the existing Todo (use the same id)
      Todo updatedTodo = widget.todo!.copyWith(
        name: title,
        description: detail,
      );

      await context.read<TodoCubit>().editTodo(updatedTodo);

      if (context.mounted) {
        _pop(context);
        _pop(context);
      }
    } else {
      // Create a new Todo
      Todo newTodo = Todo(
        id: DateTime.now().millisecondsSinceEpoch,
        name: title,
        description: detail,
        deadline: '1-01-2022',
      );

      await context.read<TodoCubit>().addTodo(newTodo);

      if (context.mounted) {
        _pop(context);
      }
    }
  }

  void _pop(BuildContext context) => Navigator.of(context).pop();
}
