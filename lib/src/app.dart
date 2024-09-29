import 'package:flutter/material.dart';

// local imports
import 'package:todo_app/src/localization/string_hardcoded.dart';
import 'package:todo_app/src/features/presentation/my_tasks/my_todo_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      restorationScopeId: 'app',
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (BuildContext context) => 'TODO App'.hardcoded,
      home: const MyTodoScreen(),
    );
  }
}
