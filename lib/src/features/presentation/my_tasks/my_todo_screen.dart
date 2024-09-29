import 'package:flutter/material.dart';

// local imports
import 'package:todo_app/src/utils/extensions.dart';
import 'package:todo_app/src/common/breakpoints.dart';
import 'package:todo_app/src/constants/app_sizes.dart';
import 'package:todo_app/src/common/responsive_center.dart';
import 'package:todo_app/src/common/responsive_scrollable_card.dart';
import 'package:todo_app/src/features/presentation/my_tasks/todo_list_view.dart';
import 'package:todo_app/src/features/presentation/add_tasks/add_todo_screen.dart';

class MyTodoScreen extends StatelessWidget {
  const MyTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.loc.myTodos)),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > Breakpoint.tablet) {
            return const ResponsiveScrollableCard(child: TodoListView());
          }

          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.p12),
            child: ResponsiveCenter(child: TodoListView()),
          );
        },
      ),
      floatingActionButton: _floatingActionButton(context),
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const AddTodoScreen()),
      ),
    );
  }
}
