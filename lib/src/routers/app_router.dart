import 'package:go_router/go_router.dart';

// local imports
import 'package:todo_app/src/features/presentation/my_tasks/my_tasks_screen.dart';
import 'package:todo_app/src/features/presentation/add_tasks/add_tasks_screen.dart';

enum AppRoute { mytasks, addtask, settings }

final appRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/mytasks',
  routes: [
    GoRoute(
      path: '/mytasks',
      name: AppRoute.mytasks.name,
      builder: (context, state) => const MyTasksScreen(),
      routes: [
        GoRoute(
          path: 'addtask',
          name: AppRoute.addtask.name,
          builder: (context, state) => const AddTaskScreen(),
        ),
      ],
    ),
  ],
);
