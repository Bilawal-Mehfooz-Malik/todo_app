part of 'speech_recognition_cubit.dart';

abstract class SpeechRecognitionState extends Equatable {
  const SpeechRecognitionState();

  @override
  List<Object> get props => [];
}

class SpeechRecognitionInitial extends SpeechRecognitionState {}

class SpeechRecognitionLoading extends SpeechRecognitionState {}

class SpeechRecognitionAvailable extends SpeechRecognitionState {
  final String recognizedWords;

  const SpeechRecognitionAvailable({this.recognizedWords = ''});

  @override
  List<Object> get props => [recognizedWords];
}

class SpeechRecognitionListening extends SpeechRecognitionState {
  final String recognizedWords;

  const SpeechRecognitionListening({required this.recognizedWords});

  @override
  List<Object> get props => [recognizedWords];
}

class SpeechRecognitionError extends SpeechRecognitionState {
  final String message;

  const SpeechRecognitionError({required this.message});

  @override
  List<Object> get props => [message];
}