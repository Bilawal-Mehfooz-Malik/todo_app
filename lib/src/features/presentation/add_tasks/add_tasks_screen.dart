import 'package:flutter/material.dart';
import 'package:todo_app/src/common/breakpoints.dart';
import 'package:todo_app/src/common/responsive_scrollable_card.dart';

// local imports
import 'package:todo_app/src/constants/app_sizes.dart';
import 'package:todo_app/src/features/presentation/add_tasks/add_task_body.dart';
import 'package:todo_app/src/localization/string_hardcoded.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Todo'.hardcoded)),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > Breakpoint.tablet) {
            return const ResponsiveScrollableCard(child: AddTaskBody());
          }

          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.p12),
            child: AddTaskBody(),
          );
        },
      ),
    );
  }
}
