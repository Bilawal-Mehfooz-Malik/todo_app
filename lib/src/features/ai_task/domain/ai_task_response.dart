import 'package:todo_app/src/features/ai_task/domain/ai_task_draft.dart';

enum AiTaskResponseStatus { clarificationNeeded, taskReady, error }

class AiTaskResponse {
  final AiTaskResponseStatus status;
  final String? clarificationQuestion;
  final AiTaskDraft? taskDraft;
  final String? errorMessage;

  AiTaskResponse._({
    required this.status,
    this.clarificationQuestion,
    this.taskDraft,
    this.errorMessage,
  });

  factory AiTaskResponse.clarificationNeeded(String question) {
    return AiTaskResponse._(
      status: AiTaskResponseStatus.clarificationNeeded,
      clarificationQuestion: question,
    );
  }

  factory AiTaskResponse.taskReady({
    required String title,
    required String description,
    required DateTime deadline,
  }) {
    return AiTaskResponse._(
      status: AiTaskResponseStatus.taskReady,
      taskDraft: AiTaskDraft(
        title: title,
        description: description,
        deadline: deadline,
      ),
    );
  }

  factory AiTaskResponse.error(String message) {
    return AiTaskResponse._(
      status: AiTaskResponseStatus.error,
      errorMessage: message,
    );
  }
}
