import 'package:equatable/equatable.dart';
import 'package:todo_app/src/features/ai_task/domain/ai_task_draft.dart';

abstract class AiTaskState extends Equatable {
  const AiTaskState();

  @override
  List<Object?> get props => [];
}

class AiTaskInitial extends AiTaskState {
  const AiTaskInitial();
}

class AiTaskLoading extends AiTaskState {
  const AiTaskLoading();
}

class AiTaskClarificationNeeded extends AiTaskState {
  final String question;
  const AiTaskClarificationNeeded(this.question);

  @override
  List<Object?> get props => [question];
}

class AiTaskReadyForConfirmation extends AiTaskState {
  final AiTaskDraft draft;
  const AiTaskReadyForConfirmation(this.draft);

  @override
  List<Object?> get props => [draft];
}

class AiTaskError extends AiTaskState {
  final String message;
  const AiTaskError(this.message);

  @override
  List<Object?> get props => [message];
}

class AiTaskSaved extends AiTaskState {
  const AiTaskSaved();
}
