import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/utils/extensions.dart';
import 'package:todo_app/src/constants/app_sizes.dart';
import 'package:todo_app/src/utils/date_formatter.dart';
import 'package:todo_app/src/common/alert_dialogues.dart';
import 'package:todo_app/src/common/custom_icon_button.dart';
import 'package:todo_app/src/features/domain/todo_model.dart';
import 'package:todo_app/src/features/presentation/cubits/todo_cubit.dart';
import 'package:todo_app/src/features/presentation/add_todo/add_todo_screen.dart';

class TodoDetailScreen extends StatelessWidget {
  final Todo todo;

  const TodoDetailScreen({super.key, required this.todo});

  void _navigateToEdit(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => AddTodoScreen(todo: todo)));
  }

  Future<void> _onDelete(BuildContext context) async {
    final confirmed = await showCustomAlertDialog(
      context: context,
      title: context.loc.todoDelete,
      content: context.loc.deleteTodoBody,
      cancelActionText: context.loc.cancel,
      defaultActionText: context.loc.delete,
    );

    if (confirmed == true && context.mounted) {
      context.read<TodoCubit>().deleteTodo(todo.id);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTodoDetailContent(context),
              _buildEditButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildTodoDetailContent(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          gapH12,
          _buildTopButtons(context),
          gapH24,
          Text(todo.name, style: context.txtTheme.titleLarge),
          gapH8,
          _buildDescription(context),
          gapH24,
          _buildDeadlineRow(context),
        ],
      ),
    );
  }

  Row _buildTopButtons(BuildContext context) {
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
          onTap: () => _onDelete(context),
        ),
      ],
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      todo.description,
      style: context.txtTheme.bodyLarge!.copyWith(
        color: context.color.onSecondary,
      ),
    );
  }

  Widget _buildDeadlineRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_buildDeadlineLabel(context), _buildDeadlineCard(context)],
    );
  }

  Widget _buildDeadlineLabel(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.alarm_rounded, size: 25),
        gapW8,
        Text(context.loc.deadline, style: context.txtTheme.bodyLarge),
      ],
    );
  }

  Widget _buildDeadlineCard(BuildContext context) {
    return Card(
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
    );
  }

  Widget _buildEditButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _navigateToEdit(context),
      child: Text(context.loc.editTodo),
    );
  }
}
