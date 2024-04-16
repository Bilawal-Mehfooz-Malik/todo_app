import 'package:go_router/go_router.dart';

// local imports
import 'package:todo_app/src/features/my_tasks/presentation/my_tasks_screen.dart';
import 'package:todo_app/src/features/add_tasks/presentation/add_tasks_screen.dart';

enum AppRoute { mytasks, addtask, settings }

final router = GoRouter(
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
          pageBuilder: (context, state) {
            return const NoTransitionPage(child: AddTaskScreen());
          },
        ),
      ],
    ),
  ],
);
