import 'package:flutter/foundation.dart';
import 'package:subtle/models/habit.dart';
import 'package:subtle/services/storage_service.dart';
import 'package:subtle/utils/sample_data.dart';

class HabitProvider extends ChangeNotifier {
  final StorageService _storageService = StorageService();
  List<Habit> _habits = [];

  List<Habit> get habits => _habits;

  int get totalStreakDays {
    return _habits.fold(0, (sum, habit) => sum + habit.currentStreak);
  }

  int get completedTodayCount {
    return _habits.where((habit) => habit.isCompletedToday).length;
  }

  Future<void> loadHabits() async {
    _habits = await _storageService.getHabits();
    
    // Add sample data if no habits exist
    if (_habits.isEmpty) {
      _habits = SampleData.getSampleHabits();
      await _storageService.saveHabits(_habits);
    }
    
    notifyListeners();
  }

  Future<void> addHabit(Habit habit) async {
    _habits.add(habit);
    await _storageService.saveHabits(_habits);
    notifyListeners();
  }

  Future<void> updateHabit(Habit updatedHabit) async {
    final index = _habits.indexWhere((habit) => habit.id == updatedHabit.id);
    if (index != -1) {
      _habits[index] = updatedHabit;
      await _storageService.saveHabits(_habits);
      notifyListeners();
    }
  }

  Future<void> deleteHabit(String habitId) async {
    _habits.removeWhere((habit) => habit.id == habitId);
    await _storageService.saveHabits(_habits);
    notifyListeners();
  }

  Future<void> toggleHabitCompletion(String habitId) async {
    final habit = _habits.firstWhere((habit) => habit.id == habitId);
    final today = DateTime.now();
    final todayKey = DateTime(today.year, today.month, today.day);
    
    final updatedDates = List<DateTime>.from(habit.completedDates);
    
    if (habit.isCompletedToday) {
      updatedDates.removeWhere((date) => 
          DateTime(date.year, date.month, date.day) == todayKey);
    } else {
      updatedDates.add(today);
    }
    
    final updatedHabit = habit.copyWith(completedDates: updatedDates);
    await updateHabit(updatedHabit);
  }
}