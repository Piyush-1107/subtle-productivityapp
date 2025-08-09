# Subtle - Minimalistic Productivity App Architecture

## Overview
Subtle is a clean, minimalistic productivity app designed to help users focus on essential tasks, build good habits, and track their progress without overwhelming features.

## Core Features
1. **Tasks Management** - Daily task tracking with priority levels
2. **Focus Timer** - Pomodoro-style timer for deep work sessions
3. **Habit Tracking** - Build and maintain daily habits with streak tracking
4. **Progress Analytics** - Simple statistics and insights

## Technical Architecture

### Data Layer
- **Local Storage**: SharedPreferences for data persistence
- **Models**: Task, Habit, FocusSession with JSON serialization
- **Sample Data**: Pre-populated realistic content for better UX

### Business Logic Layer
- **Providers**: TaskProvider, HabitProvider, TimerProvider
- **State Management**: Provider pattern for reactive UI updates
- **Services**: StorageService for data persistence operations

### Presentation Layer
- **Screens**: Tasks, Timer, Progress with bottom navigation
- **Widgets**: Reusable components (TaskCard, HabitCard, StatsCard)
- **Theme**: Green/blue productivity-focused color scheme

### Key Design Decisions
- **Minimalism**: Focus on essential features only
- **Local-First**: No backend dependency, all data stored locally
- **Intuitive Navigation**: Bottom tab navigation for main features
- **Visual Hierarchy**: Clear typography and spacing guidelines
- **Animations**: Subtle transitions for better user experience

## File Structure
```
lib/
├── main.dart                 # App entry point with providers
├── theme.dart               # Productivity-focused color scheme
├── models/
│   ├── task.dart           # Task model with priority system
│   ├── habit.dart          # Habit model with streak tracking
│   └── focus_session.dart  # Timer session model
├── providers/
│   ├── task_provider.dart   # Task state management
│   ├── habit_provider.dart  # Habit state management
│   └── timer_provider.dart  # Timer state and logic
├── services/
│   └── storage_service.dart # Local data persistence
├── screens/
│   ├── home_page.dart      # Main navigation container
│   ├── tasks_screen.dart   # Task management interface
│   ├── timer_screen.dart   # Focus timer interface
│   ├── progress_screen.dart # Habits and statistics
│   ├── add_task_screen.dart # Task creation/editing
│   └── add_habit_screen.dart # Habit creation
├── widgets/
│   ├── task_card.dart      # Individual task display
│   ├── habit_card.dart     # Individual habit display
│   ├── daily_goal_card.dart # Daily goal widget
│   └── stats_card.dart     # Statistics display widget
└── utils/
    └── sample_data.dart    # Sample content generation
```

This architecture ensures the app remains simple, maintainable, and focused on core productivity features while providing a smooth user experience.