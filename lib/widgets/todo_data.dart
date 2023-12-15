import 'package:flutter/material.dart';

enum Priority { low, normal, high }

class ToDo {
  final String id;
  bool isCompleted;
  final String task;
  final Priority priority;

  ToDo({
    required this.id,
    required this.task,
    required this.priority,
    this.isCompleted = false,
  });

  static List<ToDo> myTodos = [];
}

void errorDialog(
  String title,
  String content,
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          )
        ],
      );
    },
  );
}
