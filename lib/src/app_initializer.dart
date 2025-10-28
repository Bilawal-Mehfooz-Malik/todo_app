import 'package:drift/native.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/src/app.dart';
import 'package:todo_app/src/features/data/database/app_database.dart';
import 'package:todo_app/src/features/data/drift_repository.dart';
import 'package:todo_app/src/features/domain/todo_repository.dart';
import 'package:todo_app/src/features/presentation/cubits/date_cubit.dart';
import 'package:todo_app/src/features/presentation/cubits/todo_cubit.dart';
import 'package:todo_app/src/localization/string_hardcoded.dart';
import 'package:todo_app/src/utils/app_logger.dart';

final getIt = GetIt.instance;

class AppInitializer {
  AppInitializer({this.forTesting = false});

  final bool forTesting;

  Future<Widget> initializeAndRun() async {
    WidgetsFlutterBinding.ensureInitialized();

    if (forTesting) {
      getIt.reset();
    }

    if (!forTesting) {
      await _initializeFirebase();
    }

    _setupDependencies();

    _registerErrorHandlers();

    final repo = await _initializeDrift();

    return _createAppWidget(repo);
  }

  Future<void> _initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  void _setupDependencies() {
    getIt.registerSingleton<Logger>(AppLogger(isTesting: forTesting));
  }

  void _registerErrorHandlers() {
    if (forTesting) return;
    final Logger logger = getIt<Logger>();

    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      logger.severe(
        'Flutter Error',
        error: details.exception,
        stackTrace: details.stack,
      );
    };
    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      logger.severe('Platform Error', error: error, stackTrace: stack);
      return true;
    };
    ErrorWidget.builder = (FlutterErrorDetails details) {
      logger.severe(
        'Widget Build Error',
        error: details.exception,
        stackTrace: details.stack,
      );
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('An error occurred'.hardcoded),
        ),
        body: Center(child: Text(details.toString())),
      );
    };
  }

  Future<TodoRepository> _initializeDrift() async {
    final database = forTesting
        ? AppDatabase.forTesting(NativeDatabase.memory())
        : AppDatabase();
    final repository = DriftRepository(database);
    getIt.registerSingleton<TodoRepository>(repository);
    return repository;
  }

  Widget _createAppWidget(TodoRepository repo) {
    final logger = getIt<Logger>();
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoCubit>(
          create: (BuildContext context) => TodoCubit(repo, logger),
        ),
        BlocProvider<DateCubit>(create: (BuildContext context) => DateCubit()),
      ],
      child: const MyApp(),
    );
  }
}
