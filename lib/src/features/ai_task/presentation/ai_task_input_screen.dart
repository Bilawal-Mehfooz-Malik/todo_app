import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/src/features/todo_list/presentation/cubits/todo_cubit.dart';
import 'package:todo_app/src/features/ai_task/application/gemini_service.dart';
import 'package:todo_app/src/features/ai_task/presentation/cubit/ai_task_cubit.dart';
import 'package:todo_app/src/features/ai_task/presentation/cubit/ai_task_state.dart';
import 'package:todo_app/src/utils/extensions.dart';
import 'package:todo_app/src/constants/app_sizes.dart';
import 'package:todo_app/src/common/alert_dialogues.dart';
import 'package:todo_app/src/features/ai_task/presentation/widgets/ai_input_section.dart';
import 'package:todo_app/src/features/ai_task/presentation/widgets/ai_response_display.dart';

class AiTaskInputScreen extends StatefulWidget {
  const AiTaskInputScreen({super.key});

  @override
  State<AiTaskInputScreen> createState() => _AiTaskInputScreenState();
}

class _AiTaskInputScreenState extends State<AiTaskInputScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AiTaskCubit>(
      create: (context) => AiTaskCubit(
        GetIt.instance<GeminiService>(),
        context.read<TodoCubit>(),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text(context.loc.aiTaskInputTitle)),
        body: BlocConsumer<AiTaskCubit, AiTaskState>(
          listener: (context, state) {
            if (state is AiTaskSaved) {
              Navigator.of(context).pop();
            } else if (state is AiTaskError) {
              showExceptionAlertDialog(
                context: context,
                title: context.loc.error,
                exception: state.message,
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(Sizes.p16),
              child: Column(
                children: [
                  AiInputSection(
                    textEditingController: _controller,
                    onSubmitPressed: () {
                      if (_controller.text.isNotEmpty) {
                        context
                            .read<AiTaskCubit>()
                            .processUserMessage(_controller.text);
                      }
                    },
                    isLoading: state is AiTaskLoading,
                  ),
                  gapH16,
                  Expanded(
                    child: AiResponseDisplay(state: state),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
