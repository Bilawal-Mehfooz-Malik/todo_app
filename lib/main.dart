import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/widgets/bottom_sheet_content.dart';
import 'package:todo_app/widgets/todo_list.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // Modal Bottom Sheet
  void _showModalBottomSheet(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        useSafeArea: true,
        showDragHandle: true,
        isScrollControlled: true,
        builder: (ctx) {
          return BottomSheetContent();
        });
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);
    return Scaffold(
      //appbar
      appBar: AppBar(
        backgroundColor: style.colorScheme.primary,
        foregroundColor: style.colorScheme.onPrimary,
        title: const Text('Todo App'),
      ),
      //list view body
      body: const TodoList(),
      //floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showModalBottomSheet(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
