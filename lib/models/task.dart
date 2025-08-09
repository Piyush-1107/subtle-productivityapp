class Task {
  final String id;
  final String title;
  final String description;
  final TaskPriority priority;
  final bool isCompleted;
  final DateTime createdAt;
  final DateTime? completedAt;
  final DateTime? deadline;

  Task({
    required this.id,
    required this.title,
    this.description = '',
    this.priority = TaskPriority.medium,
    this.isCompleted = false,
    required this.createdAt,
    this.completedAt,
    this.deadline,
  });

  Task copyWith({
    String? id,
    String? title,
    String? description,
    TaskPriority? priority,
    bool? isCompleted,
    DateTime? createdAt,
    DateTime? completedAt,
    DateTime? deadline,
  }) => Task(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    priority: priority ?? this.priority,
    isCompleted: isCompleted ?? this.isCompleted,
    createdAt: createdAt ?? this.createdAt,
    completedAt: completedAt ?? this.completedAt,
    deadline: deadline ?? this.deadline,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'priority': priority.index,
    'isCompleted': isCompleted,
    'createdAt': createdAt.millisecondsSinceEpoch,
    'completedAt': completedAt?.millisecondsSinceEpoch,
    'deadline': deadline?.millisecondsSinceEpoch,
  };

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json['id'],
    title: json['title'],
    description: json['description'] ?? '',
    priority: TaskPriority.values[json['priority'] ?? 1],
    isCompleted: json['isCompleted'] ?? false,
    createdAt: DateTime.fromMillisecondsSinceEpoch(json['createdAt']),
    completedAt: json['completedAt'] != null 
        ? DateTime.fromMillisecondsSinceEpoch(json['completedAt'])
        : null,
    deadline: json['deadline'] != null 
        ? DateTime.fromMillisecondsSinceEpoch(json['deadline'])
        : null,
  );
}

enum TaskPriority { 
  low, 
  medium, 
  high;
  
  String get name {
    switch (this) {
      case TaskPriority.low:
        return 'Low';
      case TaskPriority.medium:
        return 'Medium';
      case TaskPriority.high:
        return 'High';
    }
  }
}