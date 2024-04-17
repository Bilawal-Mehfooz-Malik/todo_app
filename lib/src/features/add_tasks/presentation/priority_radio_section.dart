import 'package:flutter/material.dart';
import 'package:todo_app/src/common/priority_radio_tile.dart';
import 'package:todo_app/src/features/my_tasks/domain/task.dart';

class PriorityRadioSection extends StatefulWidget {
  const PriorityRadioSection({super.key});

  @override
  State<PriorityRadioSection> createState() => _PriorityRadioSectionState();
}

class _PriorityRadioSectionState extends State<PriorityRadioSection> {
  Priority _selectedPriority = Priority.normal;
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Choose the priority of your work',
          style: style.textTheme.titleLarge,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PriorityRadioTile(
              title: 'Urgent',
              value: Priority.urgent,
              groupValue: _selectedPriority,
              onChanged: _choosePriority,
            ),
            PriorityRadioTile(
              title: 'Normal',
              value: Priority.normal,
              groupValue: _selectedPriority,
              onChanged: _choosePriority,
            ),
          ],
        ),
      ],
    );
  }

  void _choosePriority(value) {
    setState(() {
      _selectedPriority = value as Priority;
    });
  }
}
