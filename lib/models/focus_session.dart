class FocusSession {
  final String id;
  final int durationMinutes;
  final DateTime startTime;
  final DateTime? endTime;
  final bool isCompleted;

  FocusSession({
    required this.id,
    required this.durationMinutes,
    required this.startTime,
    this.endTime,
    this.isCompleted = false,
  });

  Duration get actualDuration {
    if (endTime != null) {
      return endTime!.difference(startTime);
    }
    return Duration.zero;
  }

  FocusSession copyWith({
    String? id,
    int? durationMinutes,
    DateTime? startTime,
    DateTime? endTime,
    bool? isCompleted,
  }) => FocusSession(
    id: id ?? this.id,
    durationMinutes: durationMinutes ?? this.durationMinutes,
    startTime: startTime ?? this.startTime,
    endTime: endTime ?? this.endTime,
    isCompleted: isCompleted ?? this.isCompleted,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'durationMinutes': durationMinutes,
    'startTime': startTime.millisecondsSinceEpoch,
    'endTime': endTime?.millisecondsSinceEpoch,
    'isCompleted': isCompleted,
  };

  factory FocusSession.fromJson(Map<String, dynamic> json) => FocusSession(
    id: json['id'],
    durationMinutes: json['durationMinutes'],
    startTime: DateTime.fromMillisecondsSinceEpoch(json['startTime']),
    endTime: json['endTime'] != null 
        ? DateTime.fromMillisecondsSinceEpoch(json['endTime'])
        : null,
    isCompleted: json['isCompleted'] ?? false,
  );
}