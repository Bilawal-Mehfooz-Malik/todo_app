import 'package:flutter/material.dart';
import 'package:todo_app/src/constants/app_sizes.dart';
import 'package:todo_app/src/common/custom_text_field.dart';
import 'package:todo_app/src/common/custom_elevated_button.dart';
import 'package:todo_app/src/utils/extensions.dart';

class AiInputSection extends StatelessWidget {
  const AiInputSection({
    super.key,
    required this.textEditingController,
    required this.onSubmitPressed,
    required this.isLoading,
  });

  final TextEditingController textEditingController;
  final VoidCallback? onSubmitPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: textEditingController,
          hintText: context.loc.aiInputHint,
          maxLines: 5,
        ),
        gapH16,
        CustomElevatedButton(
          onPressed: isLoading ? null : onSubmitPressed,
          text: context.loc.submitButton,
        ),
      ],
    );
  }
}
