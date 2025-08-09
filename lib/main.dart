import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subtle/theme.dart';
import 'package:subtle/providers/task_provider.dart';
import 'package:subtle/providers/habit_provider.dart';
import 'package:subtle/providers/timer_provider.dart';
import 'package:subtle/providers/theme_provider.dart';
import 'package:subtle/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
        ChangeNotifierProvider(create: (_) => HabitProvider()),
        ChangeNotifierProvider(create: (_) => TimerProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()..loadTheme()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Subtle',
            debugShowCheckedModeBanner: false,
            theme: getThemeData(themeProvider.currentTheme, false),
            darkTheme: getThemeData(themeProvider.currentTheme, true),
            themeMode: ThemeMode.system,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
