import 'package:flutter/material.dart';
import 'package:todo_app/src/features/my_tasks/domain/task.dart';

class PriorityRadioTile extends StatelessWidget {
  final String title;
  final Priority value;
  final Priority groupValue;
  final ValueChanged<Priority?> onChanged;

  const PriorityRadioTile({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: RadioListTile(
        contentPadding: const EdgeInsets.only(left: 0),
        title: Text(title),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}
