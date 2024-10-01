import 'package:flutter/material.dart';

// local imports
import 'package:todo_app/src/utils/extensions.dart';
import 'package:todo_app/src/constants/app_sizes.dart';
import 'package:todo_app/src/features/presentation/add_todo/add_todo_body.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.loc.addTodo)),
      body: const Padding(
        padding: EdgeInsets.all(Sizes.p12),
        child: SingleChildScrollView(child: AddTodoBody()),
      ),
    );
  }
}
