class AiTaskDraft {
  final String title;
  final String description;
  final DateTime deadline;

  AiTaskDraft({
    required this.title,
    required this.description,
    required this.deadline,
  });

  factory AiTaskDraft.fromJson(Map<String, dynamic> json) {
    return AiTaskDraft(
      title: json['title'] as String? ?? 'No Title',
      description: json['description'] as String? ?? '',
      deadline:
          DateTime.tryParse(json['deadline'] as String? ?? '') ??
          DateTime.now(),
    );
  }
}
