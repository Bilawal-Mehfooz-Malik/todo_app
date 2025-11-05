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
  factory AiTaskResponse.fromJson(Map<String, dynamic> json) {
    final status = json['status'] as String?;
    if (status == null) {
      return AiTaskResponse.error('Missing status in JSON response.');
    }

    switch (status) {
      case 'task_ready':
        final taskJson = json['task'] as Map<String, dynamic>?;
        if (taskJson == null) {
          return AiTaskResponse.error('Missing task data in JSON.');
        }
        final draft = AiTaskDraft.fromJson(taskJson);
        return AiTaskResponse._(
          status: AiTaskResponseStatus.taskReady,
          taskDraft: draft,
        );

      case 'clarification_needed':
        return AiTaskResponse.clarificationNeeded(
          json['question'] as String? ?? 'No question provided.',
        );

      case 'error':
        return AiTaskResponse.error(
          json['message'] as String? ?? 'Unknown error occurred.',
        );

      default:
        return AiTaskResponse.error('Unexpected status: $status');
    }
  }
}
