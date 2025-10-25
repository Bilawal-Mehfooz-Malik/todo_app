import 'package:flutter/material.dart';
import 'package:todo_app/src/app_initializer.dart';

/// The entry point of the Flutter application.
/// It delegates the initialization process to the [AppInitializer] class
/// to keep the main function clean and focused on running the app.
void main() async {
  // Initialize and run the application using the AppInitializer.
  runApp(await AppInitializer().initializeAndRun());
}
