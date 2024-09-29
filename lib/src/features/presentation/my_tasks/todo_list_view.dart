import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// local imports
import 'package:todo_app/src/utils/extensions.dart';
import 'package:todo_app/src/features/domain/todo_model.dart';
import 'package:todo_app/src/features/presentation/todo_cubit.dart';
import 'package:todo_app/src/features/presentation/my_tasks/task_list_tile.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, List<Todo>>(
      builder: (context, todosList) {
        // converting list of tasks into list of widget
        // to pass it into column
        final todos = List.generate(
            todosList.length, (index) => TodoListTile(todo: todosList[index]));

        if (todos.isEmpty) {
          return Center(child: Text(context.loc.noTodoFound));
        }

        return Column(children: todos);
      },
    );
  }
}
