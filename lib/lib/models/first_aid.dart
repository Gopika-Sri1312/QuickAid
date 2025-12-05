class FirstAidItem {
  final String id;
  final String title;
  final String steps;

  FirstAidItem({
    required this.id,
    required this.title,
    required this.steps,
  });

  factory FirstAidItem.fromMap(Map<String, dynamic> map) {
    return FirstAidItem(
      id: map['id'],
      title: map['title'],
      steps: map['steps'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'steps': steps,
    };
  }
}
