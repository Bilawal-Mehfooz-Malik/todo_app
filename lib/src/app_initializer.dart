import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/src/app.dart';
import 'package:todo_app/src/features/data/database/app_database.dart';
import 'package:todo_app/src/features/data/drift_repository.dart';
import 'package:todo_app/src/features/domain/todo_repository.dart'; // Import TodoRepository
import 'package:todo_app/src/features/presentation/cubits/date_cubit.dart';
import 'package:todo_app/src/features/presentation/cubits/todo_cubit.dart';
import 'package:todo_app/src/localization/string_hardcoded.dart';
import 'package:todo_app/src/utils/app_logger.dart';

/// Global instance of GetIt for service location.
final getIt = GetIt.instance;

/// A class responsible for initializing the application's core services and dependencies.
/// This helps in keeping the main.dart file clean and organizes the bootstrap logic.
class AppInitializer {
  /// Initializes all necessary services and returns the root widget of the application.
  Future<Widget> initializeAndRun() async {
    // Ensure that Flutter widgets are initialized before any other operations.
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize Firebase services.
    await _initializeFirebase();

    // Set up dependency injection for various services.
    _setupDependencies();

    // Register global error handlers to catch and log errors.
    _registerErrorHandlers();

    // Initialize the Drift database and its repository.
    final repo = await _initializeDrift();

    // Create and return the main application widget with its Bloc providers.
    return _createAppWidget(repo);
  }

  /// Initializes Firebase with the default options for the current platform.
  Future<void> _initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  /// Sets up dependency injection using GetIt.
  /// Registers the AppLogger as a singleton.
  void _setupDependencies() {
    getIt.registerSingleton<Logger>(AppLogger());
  }

  /// Registers global error handlers for Flutter and platform errors.
  /// All errors are routed through the registered AppLogger.
  void _registerErrorHandlers() {
    final Logger logger = getIt<Logger>();

    // Catches errors originating from the Flutter framework.
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      logger.severe(
        'Flutter Error',
        error: details.exception,
        stackTrace: details.stack,
      );
    };
    // Catches errors from the underlying platform/OS.
    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      logger.severe('Platform Error', error: error, stackTrace: stack);
      return true;
    };
    // Catches errors that occur during the build phase of any widget.
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

  /// Initializes the Drift database and returns a DriftRepository instance.
  Future<TodoRepository> _initializeDrift() async {
    final database = AppDatabase();
    final repository = DriftRepository(database);
    getIt.registerSingleton<TodoRepository>(repository); // Register the repository
    return repository;
  }

  /// Creates the root widget of the application, providing necessary Bloc instances.
  Widget _createAppWidget(TodoRepository repo) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoCubit>(
          create: (BuildContext context) => TodoCubit(repo),
        ),
        BlocProvider<DateCubit>(create: (BuildContext context) => DateCubit()),
      ],
      child: const MyApp(),
    );
  }
}
