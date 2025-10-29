import 'package:flutter/material.dart';
import 'package:todo_app/src/common/loading.dart';
import 'package:todo_app/src/common/message.dart';
import 'package:todo_app/src/constants/app_sizes.dart';
import 'package:todo_app/src/features/ai_task/presentation/cubit/ai_task_state.dart';
import 'package:todo_app/src/features/ai_task/presentation/widgets/task_confirmation_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/features/ai_task/presentation/cubit/ai_task_cubit.dart';

class AiResponseDisplay extends StatelessWidget {
  const AiResponseDisplay({
    super.key,
    required this.state,
  });

  final AiTaskState state;

  @override
  Widget build(BuildContext context) {
    if (state is AiTaskLoading) {
      return const CenteredLoading();
    } else if (state is AiTaskClarificationNeeded) {
      final clarificationState = state as AiTaskClarificationNeeded;
      return CenteredMessage(message: clarificationState.question);
    } else if (state is AiTaskReadyForConfirmation) {
      final confirmationState = state as AiTaskReadyForConfirmation;
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Title: ${confirmationState.draft.title}'),
          Text('Description: ${confirmationState.draft.description}'),
          Text('Deadline: ${confirmationState.draft.deadline}'),
          gapH16,
          TaskConfirmationButtons(
            onConfirm: () {
              context.read<AiTaskCubit>().confirmTask(confirmationState.draft);
            },
            onCancel: () {
              context.read<AiTaskCubit>().resetState();
            },
          ),
        ],
      );
    } else if (state is AiTaskError) {
      final errorState = state as AiTaskError;
      return CenteredMessage(message: 'Error: ${errorState.message}');
    }
    return const SizedBox.shrink();
  }
}
