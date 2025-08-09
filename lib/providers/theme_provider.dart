import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppTheme {
  neutralMinimalist,
  warmEarth,
  oceanBreeze,
  forestZen,
  monochrome,
}

class ThemeProvider extends ChangeNotifier {
  AppTheme _currentTheme = AppTheme.neutralMinimalist;
  
  AppTheme get currentTheme => _currentTheme;

  void setTheme(AppTheme theme) async {
    _currentTheme = theme;
    notifyListeners();
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('app_theme', theme.toString());
  }

  void loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString('app_theme');
    
    if (themeString != null) {
      _currentTheme = AppTheme.values.firstWhere(
        (theme) => theme.toString() == themeString,
        orElse: () => AppTheme.neutralMinimalist,
      );
      notifyListeners();
    }
  }

  String getThemeName(AppTheme theme) {
    switch (theme) {
      case AppTheme.neutralMinimalist:
        return 'Neutral Minimalist';
      case AppTheme.warmEarth:
        return 'Warm Earth';
      case AppTheme.oceanBreeze:
        return 'Ocean Breeze';
      case AppTheme.forestZen:
        return 'Forest Zen';
      case AppTheme.monochrome:
        return 'Monochrome';
    }
  }

  String getThemeDescription(AppTheme theme) {
    switch (theme) {
      case AppTheme.neutralMinimalist:
        return 'Clean whites, soft grays, and muted accents';
      case AppTheme.warmEarth:
        return 'Warm beiges, soft browns, and cream tones';
      case AppTheme.oceanBreeze:
        return 'Calming blues with white and light grays';
      case AppTheme.forestZen:
        return 'Natural greens with earthy undertones';
      case AppTheme.monochrome:
        return 'Pure black, white, and gray palette';
    }
  }
}