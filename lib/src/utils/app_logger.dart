import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

/// Abstract interface for a logger.
/// Defines methods for different log levels: info, warning, and severe.
abstract class Logger {
  void info(String message);
  void warning(String message);
  void severe(String message, {Object? error, StackTrace? stackTrace});
}

/// Concrete implementation of the [Logger] interface.
/// This logger prints messages to the debug console and sends severe errors to Firebase Crashlytics.
class AppLogger implements Logger {
  /// Private constructor for the singleton pattern.
  AppLogger._();

  /// Factory constructor to provide the singleton instance of AppLogger.
  factory AppLogger() => _instance;

  /// The single instance of AppLogger.
  static final AppLogger _instance = AppLogger._();

  @override
  void info(String message) {
    _log('INFO', message);
  }

  @override
  void warning(String message) {
    _log('WARNING', message);
  }

  @override
  void severe(String message, {Object? error, StackTrace? stackTrace}) {
    _log('SEVERE', message, error: error, stackTrace: stackTrace);
    // Record severe errors with Firebase Crashlytics.
    FirebaseCrashlytics.instance.recordError(
      error,
      stackTrace,
      reason: message,
      fatal: true,
    );
  }

  /// Internal method to handle logging to the debug console.
  /// Only logs in debug mode.
  void _log(
    String level,
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (kDebugMode) {
      debugPrint("[$level] [${DateTime.now()}] $message");
      if (error != null) {
        debugPrint('Error: \$error');
      }
      if (stackTrace != null) {
        debugPrint('StackTrace: \$stackTrace');
      }
    }
  }
}
