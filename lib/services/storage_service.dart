import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subtle/models/task.dart';
import 'package:subtle/models/habit.dart';
import 'package:subtle/models/focus_session.dart';

class StorageService {
  static const String _tasksKey = 'tasks';
  static const String _habitsKey = 'habits';
  static const String _sessionsKey = 'focus_sessions';
  static const String _dailyGoalKey = 'daily_goal';

  // Tasks
  Future<List<Task>> getTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = prefs.getStringList(_tasksKey) ?? [];
    return tasksJson.map((json) => Task.fromJson(jsonDecode(json))).toList();
  }

  Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = tasks.map((task) => jsonEncode(task.toJson())).toList();
    await prefs.setStringList(_tasksKey, tasksJson);
  }

  // Habits
  Future<List<Habit>> getHabits() async {
    final prefs = await SharedPreferences.getInstance();
    final habitsJson = prefs.getStringList(_habitsKey) ?? [];
    return habitsJson.map((json) => Habit.fromJson(jsonDecode(json))).toList();
  }

  Future<void> saveHabits(List<Habit> habits) async {
    final prefs = await SharedPreferences.getInstance();
    final habitsJson = habits.map((habit) => jsonEncode(habit.toJson())).toList();
    await prefs.setStringList(_habitsKey, habitsJson);
  }

  // Focus Sessions
  Future<List<FocusSession>> getFocusSessions() async {
    final prefs = await SharedPreferences.getInstance();
    final sessionsJson = prefs.getStringList(_sessionsKey) ?? [];
    return sessionsJson.map((json) => FocusSession.fromJson(jsonDecode(json))).toList();
  }

  Future<void> saveFocusSessions(List<FocusSession> sessions) async {
    final prefs = await SharedPreferences.getInstance();
    final sessionsJson = sessions.map((session) => jsonEncode(session.toJson())).toList();
    await prefs.setStringList(_sessionsKey, sessionsJson);
  }

  // Daily Goal
  Future<String> getDailyGoal() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_dailyGoalKey) ?? '';
  }

  Future<void> saveDailyGoal(String goal) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_dailyGoalKey, goal);
  }
}