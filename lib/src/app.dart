import 'package:flutter/material.dart';

// local imports
import 'package:todo_app/src/routers/app_router.dart';
import 'package:todo_app/src/localization/string_hardcoded.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(),
      routerConfig: appRouter,
      restorationScopeId: 'app',
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (BuildContext context) => 'TODO App'.hardcoded,
    );
  }
}
