class FirstAid {
  final int id;
  final String title;
  final String summary;
  final List<String> steps;
  final String warnings;

  FirstAid({
    required this.id,
    required this.title,
    required this.summary,
    required this.steps,
    required this.warnings,
  });

  factory FirstAid.fromMap(Map<String, dynamic> m) {
    return FirstAid(
      id: m['id'],
      title: m['title'],
      summary: m['summary'] ?? '',
      steps: List<String>.from(m['steps'] ?? []),
      warnings: m['warnings'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'summary': summary,
      'steps': steps.join('||'),
      'warnings': warnings,
    };
  }

  factory FirstAid.fromDb(Map<String, dynamic> m) {
    return FirstAid(
      id: m['id'],
      title: m['title'],
      summary: m['summary'],
      steps: (m['steps'] as String).split('||'),
      warnings: m['warnings'],
    );
  }
}
