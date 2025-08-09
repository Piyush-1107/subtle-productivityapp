import 'package:subtle/models/task.dart';
import 'package:subtle/models/habit.dart';
import 'package:subtle/models/focus_session.dart';

class SampleData {
  static List<Task> getSampleTasks() {
    final now = DateTime.now();
    return [
      Task(
        id: '1',
        title: 'Review project proposal',
        description: 'Go through the client requirements and prepare feedback',
        priority: TaskPriority.high,
        createdAt: now.subtract(const Duration(hours: 2)),
        deadline: now.add(const Duration(days: 2)),
      ),
      Task(
        id: '2',
        title: 'Call dentist for appointment',
        description: '',
        priority: TaskPriority.medium,
        createdAt: now.subtract(const Duration(hours: 1)),
        deadline: now.add(const Duration(days: 1)),
      ),
      Task(
        id: '3',
        title: 'Grocery shopping',
        description: 'Milk, eggs, bread, vegetables',
        priority: TaskPriority.low,
        createdAt: now.subtract(const Duration(minutes: 30)),
      ),
      Task(
        id: '4',
        title: 'Complete morning workout',
        description: '30 minutes cardio and strength training',
        priority: TaskPriority.medium,
        createdAt: now.subtract(const Duration(hours: 3)),
        isCompleted: true,
        completedAt: now.subtract(const Duration(hours: 2, minutes: 30)),
      ),
      Task(
        id: '5',
        title: 'Team meeting preparation',
        description: 'Prepare slides and agenda for weekly team sync',
        priority: TaskPriority.high,
        createdAt: now.subtract(const Duration(days: 1)),
        deadline: now.add(const Duration(days: 3)),
      ),
      Task(
        id: '6',
        title: 'Submit expense report',
        description: 'Upload receipts and fill out expense forms',
        priority: TaskPriority.medium,
        createdAt: now.subtract(const Duration(days: 2)),
        deadline: now.add(const Duration(days: 5)),
      ),
    ];
  }

  static List<Habit> getSampleHabits() {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));
    final dayBefore = now.subtract(const Duration(days: 2));
    
    return [
      Habit(
        id: '1',
        name: 'Drink 8 glasses of water',
        emoji: '💧',
        completedDates: [dayBefore, yesterday],
        createdAt: now.subtract(const Duration(days: 5)),
      ),
      Habit(
        id: '2',
        name: 'Read for 30 minutes',
        emoji: '📖',
        completedDates: [dayBefore, yesterday, now],
        createdAt: now.subtract(const Duration(days: 7)),
      ),
      Habit(
        id: '3',
        name: 'Exercise',
        emoji: '💪',
        completedDates: [dayBefore, now],
        createdAt: now.subtract(const Duration(days: 3)),
      ),
      Habit(
        id: '4',
        name: 'Meditate',
        emoji: '🧘',
        completedDates: [yesterday],
        createdAt: now.subtract(const Duration(days: 2)),
      ),
    ];
  }

  static List<FocusSession> getSampleFocusSessions() {
    final now = DateTime.now();
    return [
      FocusSession(
        id: '1',
        durationMinutes: 25,
        startTime: now.subtract(const Duration(hours: 3)),
        endTime: now.subtract(const Duration(hours: 2, minutes: 35)),
        isCompleted: true,
      ),
      FocusSession(
        id: '2',
        durationMinutes: 15,
        startTime: now.subtract(const Duration(hours: 1, minutes: 30)),
        endTime: now.subtract(const Duration(hours: 1, minutes: 15)),
        isCompleted: true,
      ),
    ];
  }
}