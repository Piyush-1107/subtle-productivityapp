class Habit {
  final String id;
  final String name;
  final String emoji;
  final List<DateTime> completedDates;
  final DateTime createdAt;

  Habit({
    required this.id,
    required this.name,
    required this.emoji,
    required this.completedDates,
    required this.createdAt,
  });

  int get currentStreak {
    if (completedDates.isEmpty) return 0;
    
    final today = DateTime.now();
    final todayKey = DateTime(today.year, today.month, today.day);
    final sortedDates = completedDates.map((date) => 
        DateTime(date.year, date.month, date.day)).toList()
      ..sort((a, b) => b.compareTo(a));
    
    int streak = 0;
    DateTime checkDate = todayKey;
    
    for (final date in sortedDates) {
      if (date == checkDate) {
        streak++;
        checkDate = checkDate.subtract(const Duration(days: 1));
      } else if (date.isBefore(checkDate)) {
        break;
      }
    }
    
    return streak;
  }

  bool get isCompletedToday {
    final today = DateTime.now();
    final todayKey = DateTime(today.year, today.month, today.day);
    return completedDates.any((date) => 
        DateTime(date.year, date.month, date.day) == todayKey);
  }

  Habit copyWith({
    String? id,
    String? name,
    String? emoji,
    List<DateTime>? completedDates,
    DateTime? createdAt,
  }) => Habit(
    id: id ?? this.id,
    name: name ?? this.name,
    emoji: emoji ?? this.emoji,
    completedDates: completedDates ?? this.completedDates,
    createdAt: createdAt ?? this.createdAt,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'emoji': emoji,
    'completedDates': completedDates.map((date) => date.millisecondsSinceEpoch).toList(),
    'createdAt': createdAt.millisecondsSinceEpoch,
  };

  factory Habit.fromJson(Map<String, dynamic> json) => Habit(
    id: json['id'],
    name: json['name'],
    emoji: json['emoji'],
    completedDates: (json['completedDates'] as List<dynamic>)
        .map((timestamp) => DateTime.fromMillisecondsSinceEpoch(timestamp))
        .toList(),
    createdAt: DateTime.fromMillisecondsSinceEpoch(json['createdAt']),
  );
}