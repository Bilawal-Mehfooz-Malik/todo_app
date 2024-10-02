import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/utils/date_formatter.dart';
import 'package:todo_app/src/utils/extensions.dart';
import 'package:todo_app/src/constants/app_sizes.dart';
import 'package:todo_app/src/common/custom_icon_button.dart';
import 'package:todo_app/src/features/domain/todo_model.dart';
import 'package:todo_app/src/features/presentation/cubits/todo_cubit.dart';
import 'package:todo_app/src/features/presentation/add_todo/add_todo_screen.dart';

class TodoDetailScreen extends StatelessWidget {
  final int todoId;
  final Todo todo;

  const TodoDetailScreen({super.key, required this.todo, required this.todoId});

  void _navigate(BuildContext context, Todo todo) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => AddTodoScreen(todo: todo),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TodoCubit>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    gapH12,
                    _buildTopButtons(context, cubit),
                    gapH24,
                    _buildTitleSection(context, cubit),
                    gapH8,
                    Text(
                      todo.description,
                      style: context.txtTheme.bodyLarge!
                          .copyWith(color: context.color.onSecondary),
                    ),
                    gapH24,
                    _buildDeadline(context),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => _navigate(context, todo),
                child: Text(context.loc.editTodo),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildTopButtons(BuildContext context, TodoCubit cubit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
          icon: Icons.close,
          onTap: () => Navigator.of(context).pop(),
        ),
        CustomIconButton(
          color: context.color.error,
          icon: Icons.delete,
          onTap: () {
            cubit.deleteTodo(todo.id);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Row _buildTitleSection(BuildContext context, TodoCubit cubit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(todo.name, style: context.txtTheme.titleLarge)),
        Checkbox(
          value: todo.isCompleted,
          onChanged: (value) => cubit.toggleCompletion(todo),
        ),
      ],
    );
  }

  Row _buildDeadline(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.alarm_rounded, size: 25),
            gapW8,
            Text(context.loc.deadline, style: context.txtTheme.bodyLarge),
          ],
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.p20,
              vertical: Sizes.p12,
            ),
            child: Text(
              kDateFormatter.format(todo.deadline),
              style: context.txtTheme.bodyMedium,
            ),
          ),
        ),
      ],
    );
  }
}
