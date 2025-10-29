import 'package:flutter/material.dart';
import 'package:todo_app/src/constants/app_sizes.dart';
import 'package:todo_app/src/common/custom_elevated_button.dart';
import 'package:todo_app/src/utils/extensions.dart';

class TaskConfirmationButtons extends StatelessWidget {
  const TaskConfirmationButtons({
    super.key,
    required this.onConfirm,
    required this.onCancel,
  });

  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomElevatedButton(
          onPressed: onConfirm,
          text: context.loc.confirmButton,
        ),
        gapW16,
        CustomElevatedButton(
          onPressed: onCancel,
          text: context.loc.cancelButton,
        ),
      ],
    );
  }
}
