import 'package:flutter/foundation.dart';
import 'package:subtle/models/task.dart';
import 'package:subtle/services/storage_service.dart';
import 'package:subtle/utils/sample_data.dart';

class TaskProvider extends ChangeNotifier {
  final StorageService _storageService = StorageService();
  List<Task> _tasks = [];
  String _dailyGoal = '';

  List<Task> get tasks => _tasks;
  String get dailyGoal => _dailyGoal;
  
  List<Task> get todayTasks {
    final today = DateTime.now();
    final todayStart = DateTime(today.year, today.month, today.day);
    final todayEnd = todayStart.add(const Duration(days: 1));
    
    return _tasks.where((task) => 
        task.createdAt.isAfter(todayStart) && 
        task.createdAt.isBefore(todayEnd)).toList();
  }

  List<Task> get completedTasks => _tasks.where((task) => task.isCompleted).toList();
  List<Task> get pendingTasks => _tasks.where((task) => !task.isCompleted).toList();

  Future<void> loadTasks() async {
    _tasks = await _storageService.getTasks();
    _dailyGoal = await _storageService.getDailyGoal();
    
    // Add sample data if no tasks exist
    if (_tasks.isEmpty) {
      _tasks = SampleData.getSampleTasks();
      await _storageService.saveTasks(_tasks);
    }
    
    // Set sample daily goal if empty
    if (_dailyGoal.isEmpty) {
      _dailyGoal = 'Complete all high-priority tasks and stay focused';
      await _storageService.saveDailyGoal(_dailyGoal);
    }
    
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    _tasks.add(task);
    await _storageService.saveTasks(_tasks);
    notifyListeners();
  }

  Future<void> updateTask(Task updatedTask) async {
    final index = _tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      _tasks[index] = updatedTask;
      await _storageService.saveTasks(_tasks);
      notifyListeners();
    }
  }

  Future<void> deleteTask(String taskId) async {
    _tasks.removeWhere((task) => task.id == taskId);
    await _storageService.saveTasks(_tasks);
    notifyListeners();
  }

  Future<void> toggleTaskCompletion(String taskId) async {
    final task = _tasks.firstWhere((task) => task.id == taskId);
    final updatedTask = task.copyWith(
      isCompleted: !task.isCompleted,
      completedAt: !task.isCompleted ? DateTime.now() : null,
    );
    await updateTask(updatedTask);
  }

  Future<void> updateDailyGoal(String goal) async {
    _dailyGoal = goal;
    await _storageService.saveDailyGoal(goal);
    notifyListeners();
  }
}