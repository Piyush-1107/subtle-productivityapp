import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:subtle/models/focus_session.dart';
import 'package:subtle/services/storage_service.dart';
import 'package:subtle/utils/sample_data.dart';

class TimerProvider extends ChangeNotifier {
  final StorageService _storageService = StorageService();
  List<FocusSession> _sessions = [];
  
  Timer? _timer;
  int _remainingSeconds = 0;
  bool _isRunning = false;
  bool _isBreak = false;
  FocusSession? _currentSession;

  List<FocusSession> get sessions => _sessions;
  int get remainingSeconds => _remainingSeconds;
  bool get isRunning => _isRunning;
  bool get isBreak => _isBreak;
  FocusSession? get currentSession => _currentSession;

  String get formattedTime {
    final minutes = _remainingSeconds ~/ 60;
    final seconds = _remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  int get todayFocusMinutes {
    final today = DateTime.now();
    final todayStart = DateTime(today.year, today.month, today.day);
    final todayEnd = todayStart.add(const Duration(days: 1));
    
    return _sessions
        .where((session) => 
            session.isCompleted &&
            session.startTime.isAfter(todayStart) && 
            session.startTime.isBefore(todayEnd))
        .fold(0, (sum, session) => sum + session.durationMinutes);
  }

  Future<void> loadSessions() async {
    _sessions = await _storageService.getFocusSessions();
    
    // Add sample data if no sessions exist
    if (_sessions.isEmpty) {
      _sessions = SampleData.getSampleFocusSessions();
      await _storageService.saveFocusSessions(_sessions);
    }
    
    notifyListeners();
  }

  void startTimer(int minutes) {
    if (_isRunning) return;
    
    _remainingSeconds = minutes * 60;
    _isRunning = true;
    _isBreak = false;
    
    _currentSession = FocusSession(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      durationMinutes: minutes,
      startTime: DateTime.now(),
    );

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        notifyListeners();
      } else {
        _completeSession();
      }
    });
    
    notifyListeners();
  }

  void startBreak(int minutes) {
    if (_isRunning) return;
    
    _remainingSeconds = minutes * 60;
    _isRunning = true;
    _isBreak = true;
    _currentSession = null;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        notifyListeners();
      } else {
        stopTimer();
      }
    });
    
    notifyListeners();
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
    _isRunning = false;
    _isBreak = false;
    _remainingSeconds = 0;
    _currentSession = null;
    notifyListeners();
  }

  Future<void> _completeSession() async {
    if (_currentSession != null) {
      final completedSession = _currentSession!.copyWith(
        endTime: DateTime.now(),
        isCompleted: true,
      );
      
      _sessions.add(completedSession);
      await _storageService.saveFocusSessions(_sessions);
    }
    
    _timer?.cancel();
    _timer = null;
    _isRunning = false;
    _remainingSeconds = 0;
    _currentSession = null;
    notifyListeners();
  }
}