import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/src/common/breakpoints.dart';
import 'package:todo_app/src/common/responsive_center.dart';
import 'package:todo_app/src/common/responsive_scrollable_card.dart';
import 'package:todo_app/src/constants/app_sizes.dart';

// local imports
import 'package:todo_app/src/routers/app_router.dart';
import 'package:todo_app/src/constants/test_tasks.dart';
import 'package:todo_app/src/localization/string_hardcoded.dart';
import 'package:todo_app/src/features/my_tasks/presentation/task_list_view.dart';

class MyTasksScreen extends StatelessWidget {
  const MyTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with your data fetching logic
    final tasks = testTasks.toList();

    return Scaffold(
      appBar: AppBar(title: Text('My Tasks'.hardcoded)),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > Breakpoint.tablet) {
            return ResponsiveScrollableCard(child: TaskListView(tasks: tasks));
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
            child: ResponsiveCenter(child: TaskListView(tasks: tasks)),
          );
        },
      ),
      floatingActionButton: _floatingActionButton(context),
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () => context.goNamed(AppRoute.addtask.name),
    );
  }
}
