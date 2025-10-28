import 'package:flutter/material.dart';
import 'package:todo_app/src/app_initializer.dart';

void main() async {
  runApp(await AppInitializer().initializeAndRun());
}
