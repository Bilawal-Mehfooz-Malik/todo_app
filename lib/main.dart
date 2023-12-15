import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo_data.dart';
import 'package:todo_app/widgets/todo_list.dart';
import 'package:todo_app/widgets/bottom_sheet_content.dart';

void main() {
  runApp(const MyApp());
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _todoController = TextEditingController();

  // Modal Bottom Sheet
  void _showModalBottomSheet() async {
    showModalBottomSheet(
        context: context,
        useSafeArea: true,
        showDragHandle: true,
        isScrollControlled: true,
        builder: (ctx) {
          return BottomSheetContent(
            onPressed: _saveTodo,
            controller: _todoController,
          );
        });
  }

  // Saving to do method
  void _saveTodo() {
    if (_todoController.text.trim().isEmpty) {
      errorDialog(
        'Empty Todo',
        'Please enter a task before saving!',
        context,
      );
      return;
    }
    // Saving ToDo into temporary Database using Todo Class
    final mytodo = ToDo(
      task: _todoController.text,
      priority: selectedPriority,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
    );

    // saving in a list
    ToDo.myTodos.add(mytodo);
    _todoController.clear();
    setState(() {
      selectedPriority = Priority.normal;
    });
    Navigator.of(context).pop();
  }

  // Method to check and uncheck Todo
  void _isCompleted(bool value, int index) {
    setState(() {
      ToDo.myTodos[index].isCompleted = value;
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
      body: TodoList(onChanged: _isCompleted),
      //floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: _showModalBottomSheet,
        child: const Icon(Icons.add),
      ),
    );
  }
}
