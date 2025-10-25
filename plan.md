# App Logger Implementation Plan (Custom)

This document outlines the plan to create a robust, application-wide custom logger from scratch, using the `get_it` service locator for dependency injection.

## 1. Define the Logger Interface and Implementation

We will create a new file at `lib/src/utils/app_logger.dart`. Inside this file, we will:

a.  **Define an abstract `Logger` class.** This will act as an interface, defining methods for different log levels (e.g., `info`, `warning`, `severe`). This ensures our app depends on an abstraction, not a concrete implementation, making it more modular and testable.

b.  **Create a concrete `AppLogger` class.** This class will implement the `Logger` interface. Its responsibilities will be:
    *   To print formatted log messages to the debug console. We can include timestamps and log levels for clarity.
    *   For logs of level `severe`, it will interface with the **Firebase Crashlytics** singleton to record the error, stack trace, and any relevant context.

## 2. Set up Dependency Injection with `get_it`

To make the logger easily accessible throughout the application, we will register it as a singleton with `get_it`. This is typically done once at application startup.

This setup can be placed in `main.dart` before `runApp` is called, or in a dedicated bootstrap file.

```dart
// Example for main.dart
import 'package:get_it/get_it.dart';
import 'package:todo_app/src/utils/app_logger.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // Register the custom logger as a singleton.
  getIt.registerSingleton<Logger>(AppLogger());
}

void main() {
  // ... other setup (e.g., WidgetsFlutterBinding.ensureInitialized())
  setupDependencies();
  // ...
  runApp(const MyApp());
}
```

## 3. Usage Example

To use the logger in any class (a widget, Bloc, repository, etc.), we will retrieve the singleton instance from `get_it` and call its logging methods. This decouples the calling code from the concrete logger implementation.

```dart
// In a Bloc or any other class
class MyBloc extends Bloc<MyEvent, MyState> {
  // Retrieve the logger instance from the service locator.
  final Logger _logger = getIt<Logger>();

  MyBloc() : super(InitialState()) {
    on<MyEvent>((event, emit) {
      _logger.info('A business logic event occurred: $event');
      
      try {
        // ... some logic that might fail
      } catch (e, s) {
        // Log severe errors to Crashlytics.
        _logger.severe('An error occurred in MyBloc', error: e, stackTrace: s);
      }
    });
  }
}
```