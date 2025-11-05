import 'package:mocktail/mocktail.dart';
import 'package:todo_app/src/features/todo_list/domain/todo_model.dart';
import 'package:todo_app/src/features/todo_list/domain/todo_repository.dart';
import 'package:todo_app/src/utils/app_logger.dart';

class MockLogger extends Mock implements Logger {}

class MockTodoRepository extends Mock implements TodoRepository {}

class FakeTodo extends Fake implements Todo {}
