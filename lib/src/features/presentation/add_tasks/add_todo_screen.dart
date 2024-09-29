import 'package:flutter/material.dart';

// local imports
import 'package:todo_app/src/utils/extensions.dart';
import 'package:todo_app/src/common/breakpoints.dart';
import 'package:todo_app/src/constants/app_sizes.dart';
import 'package:todo_app/src/common/responsive_scrollable_card.dart';
import 'package:todo_app/src/features/presentation/add_tasks/add_todo_body.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.loc.addTodo)),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > Breakpoint.tablet) {
            return const ResponsiveScrollableCard(child: AddTodoBody());
          }

          return const Padding(
            padding:
                EdgeInsets.symmetric(vertical: Sizes.p8, horizontal: Sizes.p12),
            child: SingleChildScrollView(child: AddTodoBody()),
          );
        },
      ),
    );
  }
}
