import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo_data.dart';

const space = SizedBox(height: 16);
var selectedPriority = Priority.normal;

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({
    super.key,
    required this.onPressed,
    required this.controller,
  });
  final VoidCallback onPressed;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);
    return StatefulBuilder(builder: (context, setState) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Column(
          children: [
            // Text Field
            _todoField(),
            space,

            //Priority Section
            Text(
              'Select Priority',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            space,
            _radioButtonSection(setState),
            space,

            // Save Button
            _saveButton(context, style),
          ],
        ),
      );
    });
  }

  //Todo TextField
  TextField _todoField() {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'what to do?',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
      ),
    );
  }

  // Save Button
  ElevatedButton _saveButton(BuildContext context, ThemeData style) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: style.colorScheme.primary,
        foregroundColor: style.colorScheme.onPrimary,
      ),
      child: const Text('Save'),
    );
  }
}

// Radio Button Section
Row _radioButtonSection(StateSetter setState) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Radio<Priority>(
        value: Priority.low,
        groupValue: selectedPriority,
        onChanged: (val) {
          setState(() {
            selectedPriority = val!;
            debugPrint(selectedPriority.toString());
          });
        },
      ),
      const Text('Low'),
      const SizedBox(width: 12),
      Radio<Priority>(
        value: Priority.normal,
        groupValue: selectedPriority,
        onChanged: (val) {
          setState(() {
            selectedPriority = val!;
            debugPrint(selectedPriority.toString());
          });
        },
      ),
      const Text('Normal'),
      const SizedBox(width: 12),
      Radio<Priority>(
        value: Priority.high,
        groupValue: selectedPriority,
        onChanged: (val) {
          setState(() {
            selectedPriority = val!;
            debugPrint(selectedPriority.toString());
          });
        },
      ),
      const Text('High'),
    ],
  );
}
