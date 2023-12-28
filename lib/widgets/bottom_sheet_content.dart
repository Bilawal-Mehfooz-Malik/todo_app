import 'package:flutter/material.dart';
import 'package:todo_app/data/todo_data.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/priority_provider.dart';

class BottomSheetContent extends ConsumerWidget {
  BottomSheetContent({super.key});

  final _space = const SizedBox(height: 16);
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = Theme.of(context);
    final saveTodo = ref.read(todoProvider.notifier);
    final selectedPriority = ref.watch(selectedPriorityProvider);
    final onChanged = ref.read(selectedPriorityProvider.notifier);

    return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Column(
            children: [
              // Text Field
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'what to do?',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0)),
                ),
              ),
              _space,

              //Priority Section
              Text(
                'Select Priority',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              _space,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<Priority>(
                    value: Priority.extra,
                    groupValue: selectedPriority,
                    onChanged: (val) {
                      onChanged.changePriority(val!);
                    },
                  ),
                  const Text('Extra'),
                  const SizedBox(width: 12),
                  Radio<Priority>(
                    value: Priority.normal,
                    groupValue: selectedPriority,
                    onChanged: (val) {
                      onChanged.changePriority(val!);
                    },
                  ),
                  const Text('Normal'),
                  const SizedBox(width: 12),
                  Radio<Priority>(
                    value: Priority.important,
                    groupValue: selectedPriority,
                    onChanged: (val) {
                      onChanged.changePriority(val!);
                    },
                  ),
                  const Text('Important'),
                ],
              ),
              _space,

              // Save Button
              ElevatedButton(
                onPressed: () {
                  saveTodo.saveTodo(
                    ref: ref,
                    context: context,
                    task: _controller.text,
                    priority: selectedPriority,
                  );
                  _controller.clear();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: style.colorScheme.primary,
                  foregroundColor: style.colorScheme.onPrimary,
                ),
                child: const Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }
}
