import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/features/presentation/cubits/todo_cubit.dart';
import 'package:todo_app/src/utils/extensions.dart';
import 'package:todo_app/src/features/presentation/my_todos/todo_list_view.dart';
import 'package:todo_app/src/features/presentation/add_todo/add_todo_screen.dart';

class MyTodoScreen extends StatefulWidget {
  const MyTodoScreen({super.key});

  @override
  State<MyTodoScreen> createState() => _MyTodoScreenState();
}

class _MyTodoScreenState extends State<MyTodoScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TodoCubit>().loadTodos();
  }

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
