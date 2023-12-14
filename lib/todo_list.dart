import 'package:flutter/material.dart';
import 'package:todo_app/todo_data.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  var _isCompleted = false;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: ToDo.myTodos.length,
        itemBuilder: (ctx, index) {
          return CheckboxListTile(
            value: false,
            onChanged: (value) {
              setState(() {
                value = value!;
              });
            },
            title: Text(ToDo.myTodos[index].task),
            subtitle: Text(ToDo.myTodos[index].priority.toString()),
          );
        });
  }
}
