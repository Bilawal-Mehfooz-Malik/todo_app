import 'package:equatable/equatable.dart';
import 'package:todo_app/src/features/ai_task/domain/ai_task_draft.dart';
import 'package:todo_app/src/features/ai_task/domain/chat_message.dart';

enum AiStateStatus {
  initial,
  loading,
  success,
  error,
  readyForConfirmation,
  saved,
}

class AiTaskState extends Equatable {
  final AiStateStatus status;
  final List<ChatMessage> messages;
  final AiTaskDraft? taskDraft;
  final String? errorMessage;
  final String? clarificationQuestion;

  const AiTaskState({
    this.status = AiStateStatus.initial,
    this.messages = const [],
    this.taskDraft,
    this.errorMessage,
    this.clarificationQuestion,
  });

  AiTaskState copyWith({
    AiStateStatus? status,
    List<ChatMessage>? messages,
    AiTaskDraft? taskDraft,
    String? errorMessage,
    String? clarificationQuestion,
  }) {
    return AiTaskState(
      status: status ?? this.status,
      messages: messages ?? this.messages,
      taskDraft: taskDraft ?? this.taskDraft,
      errorMessage: errorMessage ?? this.errorMessage,
      clarificationQuestion:
          clarificationQuestion ?? this.clarificationQuestion,
    );
  }

  @override
  List<Object?> get props => [
    status,
    messages,
    taskDraft,
    errorMessage,
    clarificationQuestion,
  ];
}
