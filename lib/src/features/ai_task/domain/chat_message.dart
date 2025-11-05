import 'package:uuid/uuid.dart';

enum Sender { user, ai }

class ChatMessage {
  final String id;
  final String text;
  final Sender sender;
  final DateTime timestamp;

  ChatMessage({required this.text, required this.sender})
    : id = const Uuid().v4(),
      timestamp = DateTime.now();
}
