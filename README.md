# Subtle

**Stay Subtle, Stay Productive**

A minimalist productivity app designed for focus and mindful task management. Built with Flutter for a seamless cross-platform experience.

## 🌟 Features

- **Task Management**: Clean and intuitive task creation and tracking
- **Habit Tracking**: Build and maintain productive habits
- **Focus Timer**: Pomodoro-style timer for focused work sessions
- **Progress Tracking**: Visualize your productivity journey
- **Calendar Integration**: View your tasks and habits in a calendar format
- **Minimalist Design**: Distraction-free interface that keeps you focused
- **Dark/Light Theme**: Automatic theme switching based on system preferences
- **Cross-Platform**: Available on iOS, Android, and Web

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.6.0)
- Dart SDK
- Android Studio / Xcode (for mobile development)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/Piyush-1107/subtle-productivityapp.git
cd subtle-productivityapp
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## 📱 Platforms

- ✅ Android
- ✅ iOS
- ✅ Web

## 🛠️ Tech Stack

- **Framework**: Flutter
- **State Management**: Provider
- **Local Storage**: SharedPreferences
- **Calendar**: Table Calendar
- **Fonts**: Google Fonts
- **Architecture**: MVVM with Provider pattern

## 📂 Project Structure

```
lib/
├── main.dart              # App entry point
├── theme.dart             # Theme configuration
├── models/                # Data models
│   ├── focus_session.dart
│   ├── habit.dart
│   └── task.dart
├── providers/             # State management
│   ├── habit_provider.dart
│   ├── task_provider.dart
│   ├── theme_provider.dart
│   └── timer_provider.dart
├── screens/               # UI screens
│   ├── home_page.dart
│   ├── tasks_screen.dart
│   ├── timer_screen.dart
│   ├── calendar_screen.dart
│   ├── progress_screen.dart
│   └── settings_screen.dart
├── services/              # Business logic
│   └── storage_service.dart
├── utils/                 # Utilities
│   └── sample_data.dart
└── widgets/               # Reusable components
    ├── app_drawer.dart
    ├── daily_goal_card.dart
    ├── habit_card.dart
    ├── stats_card.dart
    └── task_card.dart
```

## 🎨 Design Philosophy

Subtle embraces minimalism and mindful productivity. The app is designed to:

- Reduce cognitive load with clean, simple interfaces
- Focus on essential features without overwhelming users
- Promote mindful task management over endless to-do lists
- Provide gentle encouragement rather than aggressive notifications

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

This app was vibe coded using:
- [devflow.app](https://devflow.app) - For streamlined development workflow
- [VSCode GCP agentic mode](https://code.visualstudio.com/) - For AI-powered coding assistance

Built with ❤️ for productivity enthusiasts who believe in staying subtle while staying productive.

---

*"The best productivity app is the one you actually use. Stay subtle, stay focused."*
