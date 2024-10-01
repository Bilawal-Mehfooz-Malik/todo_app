import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/common/message.dart';
import 'package:todo_app/src/common/loading.dart';
import 'package:todo_app/src/utils/extensions.dart';
import 'package:todo_app/src/features/domain/todo_model.dart';
import 'package:todo_app/src/features/presentation/todo_cubit.dart';
import 'package:todo_app/src/features/presentation/todo_state.dart';
import 'package:todo_app/src/features/presentation/my_todos/task_list_tile.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        if (state is TodoError) {
          return CenteredMessage(message: state.message);
        } else if (state is TodoLoaded) {
          return _buildTodoList(context, state.todos);
        }
        return const CenteredLoading();
      },
    );
  }

  Widget _buildTodoList(BuildContext context, List<Todo> todos) {
    if (todos.isEmpty) {
      return CenteredMessage(message: context.loc.noTodoFound);
    }

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoListTile(todo: todo);
      },
    );
  }
}
