import 'package:todo_app/src/features/my_tasks/domain/task.dart';

final kTestTasks = [
  Task(
    id: '1',
    taskName: 'Ecomerece app',
    priority: Priority.urgent,
    taskDescription: 'Watch 5 videos',
    deadline: '01-10-2024',
  ),
  Task(
    id: '2',
    taskName: 'TODO App',
    priority: Priority.urgent,
    taskDescription: 'Implement any functionality',
    deadline: '01-10-2024',
  ),
  Task(
    id: '3',
    taskName: 'Online Platform search',
    taskDescription: 'Check flutter jobs',
    deadline: '01-10-2024',
  ),
  Task(
    id: '4',
    taskName: 'Assignment',
    taskDescription: 'Nothing important',
    deadline: '01-10-2024',
  ),
  Task(
    id: '5',
    taskName: 'Charging',
    taskDescription: 'Laptop, mobile, etc',
    deadline: '01-10-2024',
  ),
];
