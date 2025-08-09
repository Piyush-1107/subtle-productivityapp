import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subtle/providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Settings',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                'Theme',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Consumer<ThemeProvider>(
                  builder: (context, themeProvider, child) {
                    return ListView.separated(
                      itemCount: AppTheme.values.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final theme = AppTheme.values[index];
                        final isSelected = themeProvider.currentTheme == theme;
                        
                        return ThemeOptionCard(
                          theme: theme,
                          isSelected: isSelected,
                          onTap: () => themeProvider.setTheme(theme),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThemeOptionCard extends StatelessWidget {
  final AppTheme theme;
  final bool isSelected;
  final VoidCallback onTap;

  const ThemeOptionCard({
    super.key,
    required this.theme,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.read<ThemeProvider>();
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected 
            ? Theme.of(context).colorScheme.primaryContainer
            : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected 
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            ThemePreview(theme: theme),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    themeProvider.getThemeName(theme),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    themeProvider.getThemeDescription(theme),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}

class ThemePreview extends StatelessWidget {
  final AppTheme theme;

  const ThemePreview({super.key, required this.theme});

  List<Color> _getThemeColors(AppTheme theme) {
    switch (theme) {
      case AppTheme.neutralMinimalist:
        return [
          const Color(0xFF6B7280),
          const Color(0xFFF9FAFB),
          const Color(0xFF9CA3AF),
        ];
      case AppTheme.warmEarth:
        return [
          const Color(0xFFB08D57),
          const Color(0xFFF5F0E8),
          const Color(0xFFD4B896),
        ];
      case AppTheme.oceanBreeze:
        return [
          const Color(0xFF5B9BD5),
          const Color(0xFFE8F4FD),
          const Color(0xFF87CEEB),
        ];
      case AppTheme.forestZen:
        return [
          const Color(0xFF6B8E5A),
          const Color(0xFFE8F5E8),
          const Color(0xFF9CAF88),
        ];
      case AppTheme.monochrome:
        return [
          const Color(0xFF4B4B4B),
          const Color(0xFFF5F5F5),
          const Color(0xFF8E8E8E),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = _getThemeColors(theme);
    
    return Row(
      children: colors.map((color) => Container(
        width: 20,
        height: 20,
        margin: const EdgeInsets.only(right: 4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
            width: 0.5,
          ),
        ),
      )).toList(),
    );
  }
}