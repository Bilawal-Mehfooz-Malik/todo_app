import 'package:flutter/material.dart';
import 'package:todo_app/data/todo_data.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoList extends ConsumerWidget {
  const TodoList({Key? key, required this.priority}) : super(key: key);
  final Priority priority;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);
    final filteredTodos = todos.where((e) => e.priority == priority).toList();

    return filteredTodos.isEmpty
        ? _errorWidget()
        : CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    final todo = filteredTodos[index];
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        leading: Checkbox(
                          value: todo.isCompleted,
                          onChanged: (value) {
                            ref
                                .read(todoProvider.notifier)
                                .updateCheckBox(value!, index);
                          },
                        ),
                        title: Text(
                          todo.task,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(
                          'Priority: ${todo.priority.name}',
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 14,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {},
                        ),
                      ),
                    );
                  },
                  childCount: filteredTodos.length,
                ),
              ),
            ],
          );
  }

  Center _errorWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.sentiment_dissatisfied,
            size: 80,
            color: Colors.grey.shade600,
          ),
          const SizedBox(height: 20),
          Text(
            'Oops! No tasks here.',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Add some new tasks or take a break.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
