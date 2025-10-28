import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/src/utils/app_logger.dart';
import 'package:todo_app/src/features/domain/todo_model.dart';
import 'package:todo_app/src/features/presentation/cubits/todo_cubit.dart';
import 'package:todo_app/src/features/presentation/cubits/todo_state.dart';

import '../../../mocks.dart';

void main() {
  late MockTodoRepository mockTodoRepository;
  late MockLogger mockLogger;

  setUpAll(() {
    registerFallbackValue(FakeTodo());
  });

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    mockLogger = MockLogger();

    if (GetIt.instance.isRegistered<Logger>()) {
      GetIt.instance.unregister<Logger>();
    }
  });

  group('TodoCubit Tests', () {
    final mockTodos = [
      Todo(
        id: 1,
        name: 'Todo 1',
        description: 'Desc 1',
        deadline: DateTime.now(),
        isCompleted: false,
      ),
      Todo(
        id: 2,
        name: 'Todo 2',
        description: 'Desc 2',
        deadline: DateTime.now(),
        isCompleted: true,
      ),
    ];

    // --- loadTodos ---
    blocTest<TodoCubit, TodoState>(
      'loadTodos success',
      build: () {
        when(
          () => mockTodoRepository.getAllTodo(),
        ).thenAnswer((_) async => mockTodos);
        return TodoCubit(mockTodoRepository, mockLogger);
      },
      act: (cubit) => cubit.loadTodos(),
      expect: () => [TodoLoading(), TodoLoaded(mockTodos)],
    );

    blocTest<TodoCubit, TodoState>(
      'loadTodos failure',
      build: () {
        when(
          () => mockTodoRepository.getAllTodo(),
        ).thenThrow(Exception('Failed to load todos'));
        return TodoCubit(mockTodoRepository, mockLogger);
      },
      act: (cubit) => cubit.loadTodos(),
      expect: () => [
        TodoLoading(),
        TodoError('Exception: Failed to load todos'),
      ],
    );

    // --- addTodo ---
    blocTest<TodoCubit, TodoState>(
      'addTodo success',
      build: () {
        when(
          () => mockTodoRepository.addTodo(any()),
        ).thenAnswer((_) async => Future.value());
        when(
          () => mockTodoRepository.getAllTodo(),
        ).thenAnswer((_) async => [mockTodos.first]);
        return TodoCubit(mockTodoRepository, mockLogger);
      },
      act: (cubit) async {
        await cubit.addTodo(mockTodos.first);
      },
      expect: () => [
        TodoLoading(),
        TodoLoaded([mockTodos.first]),
      ],
      verify: (_) => verify(() => mockTodoRepository.addTodo(any())).called(1),
    );

    blocTest<TodoCubit, TodoState>(
      'addTodo failure',
      build: () {
        when(
          () => mockTodoRepository.addTodo(any()),
        ).thenThrow(Exception('Failed to add todo'));
        return TodoCubit(mockTodoRepository, mockLogger);
      },
      act: (cubit) async {
        await cubit.addTodo(mockTodos.first);
      },
      expect: () => [TodoError('Exception: Failed to add todo')],
    );

    // --- editTodo ---
    blocTest<TodoCubit, TodoState>(
      'editTodo success',
      build: () {
        when(
          () => mockTodoRepository.editTodo(any()),
        ).thenAnswer((_) async => Future.value());
        when(
          () => mockTodoRepository.getAllTodo(),
        ).thenAnswer((_) async => mockTodos);
        return TodoCubit(mockTodoRepository, mockLogger);
      },
      act: (cubit) async {
        await cubit.editTodo(mockTodos.first.copyWith(name: 'Updated Todo'));
      },
      expect: () => [TodoLoading(), TodoLoaded(mockTodos)],
    );

    blocTest<TodoCubit, TodoState>(
      'editTodo failure',
      build: () {
        when(
          () => mockTodoRepository.editTodo(any()),
        ).thenThrow(Exception('Failed to edit todo'));
        return TodoCubit(mockTodoRepository, mockLogger);
      },
      act: (cubit) async {
        await cubit.editTodo(mockTodos.first);
      },
      expect: () => [TodoError('Exception: Failed to edit todo')],
    );

    // --- toggleCompletion ---
    blocTest<TodoCubit, TodoState>(
      'toggleCompletion success',
      build: () {
        when(
          () => mockTodoRepository.toggleCompletion(any()),
        ).thenAnswer((_) async => Future.value());
        when(
          () => mockTodoRepository.getAllTodo(),
        ).thenAnswer((_) async => mockTodos);
        return TodoCubit(mockTodoRepository, mockLogger);
      },
      act: (cubit) async {
        await cubit.toggleCompletion(mockTodos.first);
      },
      expect: () => [TodoLoading(), TodoLoaded(mockTodos)],
    );

    blocTest<TodoCubit, TodoState>(
      'toggleCompletion failure',
      build: () {
        when(
          () => mockTodoRepository.toggleCompletion(any()),
        ).thenThrow(Exception('Failed to toggle completion'));
        return TodoCubit(mockTodoRepository, mockLogger);
      },
      act: (cubit) async {
        await cubit.toggleCompletion(mockTodos.first);
      },
      expect: () => [TodoError('Exception: Failed to toggle completion')],
    );

    // --- deleteTodo ---
    blocTest<TodoCubit, TodoState>(
      'deleteTodo success',
      build: () {
        when(
          () => mockTodoRepository.deleteTodo(any()),
        ).thenAnswer((_) async => Future.value());
        when(
          () => mockTodoRepository.getAllTodo(),
        ).thenAnswer((_) async => [mockTodos.last]);
        return TodoCubit(mockTodoRepository, mockLogger);
      },
      act: (cubit) async {
        await cubit.deleteTodo(mockTodos.first.id);
      },
      expect: () => [
        TodoLoading(),
        TodoLoaded([mockTodos.last]),
      ],
    );

    blocTest<TodoCubit, TodoState>(
      'deleteTodo failure',
      build: () {
        when(
          () => mockTodoRepository.deleteTodo(any()),
        ).thenThrow(Exception('Failed to delete todo'));
        return TodoCubit(mockTodoRepository, mockLogger);
      },
      act: (cubit) async {
        await cubit.deleteTodo(mockTodos.first.id);
      },
      expect: () => [TodoError('Exception: Failed to delete todo')],
    );
  });
}
