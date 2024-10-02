import 'src/app.dart';
import 'package:isar/isar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'src/localization/string_hardcoded.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/src/features/data/isar_todo.dart';
import 'package:todo_app/src/features/data/isar_repository.dart';
import 'package:todo_app/src/features/presentation/cubits/date_cubit.dart';
import 'package:todo_app/src/features/presentation/cubits/todo_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  registerErrorHandlers();

  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([IsarTodoSchema], directory: dir.path);
  final repo = IsarRepository(isar);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<TodoCubit>(
          create: (BuildContext context) => TodoCubit(repo),
        ),
        BlocProvider<DateCubit>(create: (BuildContext context) => DateCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

void registerErrorHandlers() {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint(details.toString());
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    debugPrint(error.toString());
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('An error occurred'.hardcoded),
      ),
      body: Center(child: Text(details.toString())),
    );
  };
}
