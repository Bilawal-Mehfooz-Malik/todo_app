import 'package:flutter/material.dart';
import 'package:todo_app/todo_data.dart';
import 'package:todo_app/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
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
  Priority _selectedPriority = Priority.normal;
  final _toDoController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _toDoController.dispose();
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      showDragHandle: true,
      context: context,
      builder: (ctx) {
        return StatefulBuilder(builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: Column(
              children: [
                // Text Field
                TextField(
                  controller: _toDoController,
                  decoration: InputDecoration(
                    labelText: 'what to do?',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0)),
                  ),
                ),
                const SizedBox(height: 16),

                //Priority
                Text(
                  'Select Priority',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                _radioButtonSection(setState),
                const SizedBox(height: 16),

                _saveButton(context),
              ],
            ),
          );
        });
      },
    );
  }

  void _saveTodo() {
    if (_toDoController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Empty Fields!'),
            content: const Text(
              'Please enter something in what to do text field in order to save.',
              textAlign: TextAlign.justify,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      final mytodo = ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        priority: _selectedPriority,
        task: _toDoController.text,
      );
      ToDo.myTodos.add(mytodo);
      setState(() {});
      Navigator.of(context).pop();
      _toDoController.clear();
    }
  }

  ElevatedButton _saveButton(BuildContext context) {
    return ElevatedButton(
      onPressed: _saveTodo,
      style: ElevatedButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      child: const Text('Save'),
    );
  }

// RadioButton Section
  Row _radioButtonSection(StateSetter setState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio<Priority>(
          value: Priority.low,
          groupValue: _selectedPriority,
          onChanged: (val) {
            setState(() {
              _selectedPriority = val!;
            });
          },
        ),
        const Text('Low'),
        const SizedBox(width: 12),
        Radio<Priority>(
          value: Priority.normal,
          groupValue: _selectedPriority,
          onChanged: (val) {
            setState(() {
              _selectedPriority = val!;
            });
          },
        ),
        const Text('Normal'),
        const SizedBox(width: 12),
        Radio<Priority>(
          value: Priority.high,
          groupValue: _selectedPriority,
          onChanged: (val) {
            setState(() {
              _selectedPriority = val!;
            });
          },
        ),
        const Text('High'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('Todo App'),
      ),
      body: const TodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _showBottomSheet,
        child: const Icon(Icons.add),
      ),
    );
  }
}
