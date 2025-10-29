import 'dart:convert';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:todo_app/src/features/ai_task/domain/ai_task_response.dart';
import 'package:todo_app/src/utils/app_logger.dart';
import 'package:get_it/get_it.dart';

class GeminiService {
  final GenerativeModel model;
  final Logger _logger = GetIt.instance<Logger>();

  GeminiService({required this.model});

  Future<AiTaskResponse> askGemini(
    String userMessage, {
    List<Map<String, String>>? conversationHistory,
  }) async {
    try {
      final prompt = _buildPrompt(userMessage, conversationHistory);
      final response = await model.generateContent([Content.text(prompt)]);

      final textResponse = response.text;
      if (textResponse == null) {
        return AiTaskResponse.error('Gemini returned an empty response.');
      }

      _logger.info('Gemini Raw Response: $textResponse');

      // Extract JSON from markdown code block if present
      String cleanResponse = textResponse;
      if (cleanResponse.startsWith('```json') && cleanResponse.endsWith('```')) {
        cleanResponse = cleanResponse.substring(7, cleanResponse.length - 3).trim();
      }

      final jsonResponse = jsonDecode(cleanResponse);

      if (jsonResponse['status'] == 'task_ready') {
        final task = jsonResponse['task'];
        return AiTaskResponse.taskReady(
          title: task['title'],
          description: task['description'],
          deadline: DateTime.parse(task['deadline']),
        );
      } else if (jsonResponse['status'] == 'clarification_needed') {
        return AiTaskResponse.clarificationNeeded(jsonResponse['question']);
      } else if (jsonResponse['status'] == 'error') {
        return AiTaskResponse.error(jsonResponse['message']);
      } else {
        return AiTaskResponse.error('Unexpected response format from Gemini.');
      }
    } catch (e, s) {
      _logger.severe('Error calling Gemini API', error: e, stackTrace: s);
      return AiTaskResponse.error(
        'Failed to process your request: ${e.toString()}',
      );
    }
  }

  String _buildPrompt(String userMessage, List<Map<String, String>>? history) {
    final StringBuffer prompt = StringBuffer();
    final now = DateTime.now();
    final todayDate = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

    prompt.writeln("You are a helpful assistant that extracts task information from user messages.");
    prompt.writeln("Today's date is $todayDate.");
    prompt.writeln("The user will provide a message describing a task. Your goal is to extract the task's title, description, and a specific deadline.");
    prompt.writeln("If the title or description are not explicitly provided, infer them from the user's message. Only ask for clarification if you genuinely cannot infer these fields or if the deadline is ambiguous.");
    prompt.writeln("If a deadline is mentioned, convert it to a 'YYYY-MM-DD' format. If no specific year is mentioned for a date, assume the current year. If the date is in the past, assume the next occurrence of that date.");
    prompt.writeln("If you successfully extract all information, respond with a JSON object in the following format:");
    prompt.writeln("{");
    prompt.writeln("  \"status\": \"task_ready\",");
    prompt.writeln("  \"task\": {");
    prompt.writeln("    \"title\": \"[extracted title]\",");
    prompt.writeln("    \"description\": \"[extracted description]\",");
    prompt.writeln("    \"deadline\": \"YYYY-MM-DD\"");
    prompt.writeln("  }");
    prompt.writeln("}");
    prompt.writeln("If you need more information to create the task (e.g., title, description, or a clearer deadline), respond with a JSON object in the following format:");
    prompt.writeln("{");
    prompt.writeln("  \"status\": \"clarification_needed\",");
    prompt.writeln("  \"question\": \"[your clarifying question]\"");
    prompt.writeln("}");
    prompt.writeln("If you encounter an error or cannot process the request, respond with:");
    prompt.writeln("{");
    prompt.writeln("  \"status\": \"error\",");
    prompt.writeln("  \"message\": \"[error message]\"");
    prompt.writeln("}");

    if (history != null && history.isNotEmpty) {
      for (final entry in history) {
        prompt.writeln("User: ${entry['user']}");
        prompt.writeln("Assistant: ${entry['assistant']}");
      }
    }

    prompt.writeln("User message: \"$userMessage\"");
    return prompt.toString();
  }

  Future<void> listAvailableModels() async {
    try {
      // FirebaseAI does not expose a direct listModels method like google_generative_ai did.
      // You would typically rely on Firebase console or documentation to know available models.
      _logger.info(
        'Listing models is not directly supported by firebase_ai package.',
      );
      _logger.info(
        'Please refer to Firebase console or documentation for available models.',
      );
    } catch (e, s) {
      _logger.severe('Error listing Gemini models', error: e, stackTrace: s);
    }
  }
}
