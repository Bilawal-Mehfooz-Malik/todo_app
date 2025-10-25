import 'package:flutter/material.dart';
import 'package:todo_app/src/utils/extensions.dart';
import 'package:todo_app/src/features/presentation/my_todos/todo_list_view.dart';
import 'package:todo_app/src/features/presentation/add_todo/add_todo_screen.dart';

class MyTodoScreen extends StatelessWidget {
  const MyTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.loc.myTodos)),
      body: const TodoListView(),
      floatingActionButton: _floatingActionButton(context),
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () => Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => const AddTodoScreen())),
    );
  }
}
