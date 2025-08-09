import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subtle/providers/theme_provider.dart';

// Neutral Minimalist Theme
class NeutralColors {
  static const primary = Color(0xFF6B7280);
  static const onPrimary = Color(0xFFFFFFFF);
  static const primaryContainer = Color(0xFFF9FAFB);
  static const onPrimaryContainer = Color(0xFF374151);
  static const secondary = Color(0xFF9CA3AF);
  static const onSecondary = Color(0xFF374151);
  static const tertiary = Color(0xFF8B9DC3);
  static const onTertiary = Color(0xFF374151);
  static const surface = Color(0xFFFFFFFF);
  static const onSurface = Color(0xFF1F2937);
  static const background = Color(0xFFF8FAFC);
  static const onBackground = Color(0xFF1F2937);
}

// Warm Earth Theme
class WarmEarthColors {
  static const primary = Color(0xFFB08D57);
  static const onPrimary = Color(0xFFFFFFFF);
  static const primaryContainer = Color(0xFFF5F0E8);
  static const onPrimaryContainer = Color(0xFF7C5E32);
  static const secondary = Color(0xFFD4B896);
  static const onSecondary = Color(0xFF5D4E37);
  static const tertiary = Color(0xFFC4A47C);
  static const onTertiary = Color(0xFF6B4C2A);
  static const surface = Color(0xFFFFFDF7);
  static const onSurface = Color(0xFF3C2A1E);
  static const background = Color(0xFFFAF7F0);
  static const onBackground = Color(0xFF3C2A1E);
}

// Ocean Breeze Theme
class OceanBreezeColors {
  static const primary = Color(0xFF5B9BD5);
  static const onPrimary = Color(0xFFFFFFFF);
  static const primaryContainer = Color(0xFFE8F4FD);
  static const onPrimaryContainer = Color(0xFF2D5F7F);
  static const secondary = Color(0xFF87CEEB);
  static const onSecondary = Color(0xFF1E3A5F);
  static const tertiary = Color(0xFF7FB3D3);
  static const onTertiary = Color(0xFF2D4A5F);
  static const surface = Color(0xFFFFFFFF);
  static const onSurface = Color(0xFF1B365D);
  static const background = Color(0xFFF0F8FF);
  static const onBackground = Color(0xFF1B365D);
}

// Forest Zen Theme
class ForestZenColors {
  static const primary = Color(0xFF6B8E5A);
  static const onPrimary = Color(0xFFFFFFFF);
  static const primaryContainer = Color(0xFFE8F5E8);
  static const onPrimaryContainer = Color(0xFF3D5A2F);
  static const secondary = Color(0xFF9CAF88);
  static const onSecondary = Color(0xFF2F4A2F);
  static const tertiary = Color(0xFF7A9B69);
  static const onTertiary = Color(0xFF2F4A2F);
  static const surface = Color(0xFFFFFFFE);
  static const onSurface = Color(0xFF1A2E1A);
  static const background = Color(0xFFF0F7F0);
  static const onBackground = Color(0xFF1A2E1A);
}

// Monochrome Theme
class MonochromeColors {
  static const primary = Color(0xFF4B4B4B);
  static const onPrimary = Color(0xFFFFFFFF);
  static const primaryContainer = Color(0xFFF5F5F5);
  static const onPrimaryContainer = Color(0xFF2B2B2B);
  static const secondary = Color(0xFF707070);
  static const onSecondary = Color(0xFFFFFFFF);
  static const tertiary = Color(0xFF8E8E8E);
  static const onTertiary = Color(0xFF2B2B2B);
  static const surface = Color(0xFFFFFFFF);
  static const onSurface = Color(0xFF1C1C1C);
  static const background = Color(0xFFFAFAFA);
  static const onBackground = Color(0xFF1C1C1C);
}

class FontSizes {
  static const double displayLarge = 57.0;
  static const double displayMedium = 45.0;
  static const double displaySmall = 36.0;
  static const double headlineLarge = 32.0;
  static const double headlineMedium = 24.0;
  static const double headlineSmall = 22.0;
  static const double titleLarge = 22.0;
  static const double titleMedium = 18.0;
  static const double titleSmall = 16.0;
  static const double labelLarge = 16.0;
  static const double labelMedium = 14.0;
  static const double labelSmall = 12.0;
  static const double bodyLarge = 16.0;
  static const double bodyMedium = 14.0;
  static const double bodySmall = 12.0;
}

ThemeData getThemeData(AppTheme appTheme, bool isDark) {
  Color primary, onPrimary, primaryContainer, onPrimaryContainer;
  Color secondary, onSecondary, tertiary, onTertiary;
  Color surface, onSurface, background, onBackground;

  if (isDark) {
    // Dark theme variants
    switch (appTheme) {
      case AppTheme.neutralMinimalist:
        primary = const Color(0xFF9CA3AF);
        onPrimary = const Color(0xFF1F2937);
        primaryContainer = const Color(0xFF374151);
        onPrimaryContainer = const Color(0xFFF9FAFB);
        secondary = const Color(0xFF6B7280);
        onSecondary = const Color(0xFFF9FAFB);
        tertiary = const Color(0xFF8B9DC3);
        onTertiary = const Color(0xFFF9FAFB);
        surface = const Color(0xFF1F2937);
        onSurface = const Color(0xFFF9FAFB);
        background = const Color(0xFF111827);
        onBackground = const Color(0xFFF9FAFB);
        break;
      case AppTheme.warmEarth:
        primary = const Color(0xFFD4B896);
        onPrimary = const Color(0xFF3C2A1E);
        primaryContainer = const Color(0xFF7C5E32);
        onPrimaryContainer = const Color(0xFFF5F0E8);
        secondary = const Color(0xFFB08D57);
        onSecondary = const Color(0xFF3C2A1E);
        tertiary = const Color(0xFFC4A47C);
        onTertiary = const Color(0xFF3C2A1E);
        surface = const Color(0xFF3C2A1E);
        onSurface = const Color(0xFFFAF7F0);
        background = const Color(0xFF2A1F16);
        onBackground = const Color(0xFFFAF7F0);
        break;
      case AppTheme.oceanBreeze:
        primary = const Color(0xFF87CEEB);
        onPrimary = const Color(0xFF1B365D);
        primaryContainer = const Color(0xFF2D5F7F);
        onPrimaryContainer = const Color(0xFFE8F4FD);
        secondary = const Color(0xFF5B9BD5);
        onSecondary = const Color(0xFF1B365D);
        tertiary = const Color(0xFF7FB3D3);
        onTertiary = const Color(0xFF1B365D);
        surface = const Color(0xFF1B365D);
        onSurface = const Color(0xFFF0F8FF);
        background = const Color(0xFF0F2A4A);
        onBackground = const Color(0xFFF0F8FF);
        break;
      case AppTheme.forestZen:
        primary = const Color(0xFF9CAF88);
        onPrimary = const Color(0xFF1A2E1A);
        primaryContainer = const Color(0xFF3D5A2F);
        onPrimaryContainer = const Color(0xFFE8F5E8);
        secondary = const Color(0xFF6B8E5A);
        onSecondary = const Color(0xFF1A2E1A);
        tertiary = const Color(0xFF7A9B69);
        onTertiary = const Color(0xFF1A2E1A);
        surface = const Color(0xFF1A2E1A);
        onSurface = const Color(0xFFF0F7F0);
        background = const Color(0xFF0F1F0F);
        onBackground = const Color(0xFFF0F7F0);
        break;
      case AppTheme.monochrome:
        primary = const Color(0xFF8E8E8E);
        onPrimary = const Color(0xFF1C1C1C);
        primaryContainer = const Color(0xFF2B2B2B);
        onPrimaryContainer = const Color(0xFFF5F5F5);
        secondary = const Color(0xFF4B4B4B);
        onSecondary = const Color(0xFFFFFFFF);
        tertiary = const Color(0xFF707070);
        onTertiary = const Color(0xFFFFFFFF);
        surface = const Color(0xFF1C1C1C);
        onSurface = const Color(0xFFFAFAFA);
        background = const Color(0xFF000000);
        onBackground = const Color(0xFFFAFAFA);
        break;
    }
  } else {
    // Light theme variants
    switch (appTheme) {
      case AppTheme.neutralMinimalist:
        primary = NeutralColors.primary;
        onPrimary = NeutralColors.onPrimary;
        primaryContainer = NeutralColors.primaryContainer;
        onPrimaryContainer = NeutralColors.onPrimaryContainer;
        secondary = NeutralColors.secondary;
        onSecondary = NeutralColors.onSecondary;
        tertiary = NeutralColors.tertiary;
        onTertiary = NeutralColors.onTertiary;
        surface = NeutralColors.surface;
        onSurface = NeutralColors.onSurface;
        background = NeutralColors.background;
        onBackground = NeutralColors.onBackground;
        break;
      case AppTheme.warmEarth:
        primary = WarmEarthColors.primary;
        onPrimary = WarmEarthColors.onPrimary;
        primaryContainer = WarmEarthColors.primaryContainer;
        onPrimaryContainer = WarmEarthColors.onPrimaryContainer;
        secondary = WarmEarthColors.secondary;
        onSecondary = WarmEarthColors.onSecondary;
        tertiary = WarmEarthColors.tertiary;
        onTertiary = WarmEarthColors.onTertiary;
        surface = WarmEarthColors.surface;
        onSurface = WarmEarthColors.onSurface;
        background = WarmEarthColors.background;
        onBackground = WarmEarthColors.onBackground;
        break;
      case AppTheme.oceanBreeze:
        primary = OceanBreezeColors.primary;
        onPrimary = OceanBreezeColors.onPrimary;
        primaryContainer = OceanBreezeColors.primaryContainer;
        onPrimaryContainer = OceanBreezeColors.onPrimaryContainer;
        secondary = OceanBreezeColors.secondary;
        onSecondary = OceanBreezeColors.onSecondary;
        tertiary = OceanBreezeColors.tertiary;
        onTertiary = OceanBreezeColors.onTertiary;
        surface = OceanBreezeColors.surface;
        onSurface = OceanBreezeColors.onSurface;
        background = OceanBreezeColors.background;
        onBackground = OceanBreezeColors.onBackground;
        break;
      case AppTheme.forestZen:
        primary = ForestZenColors.primary;
        onPrimary = ForestZenColors.onPrimary;
        primaryContainer = ForestZenColors.primaryContainer;
        onPrimaryContainer = ForestZenColors.onPrimaryContainer;
        secondary = ForestZenColors.secondary;
        onSecondary = ForestZenColors.onSecondary;
        tertiary = ForestZenColors.tertiary;
        onTertiary = ForestZenColors.onTertiary;
        surface = ForestZenColors.surface;
        onSurface = ForestZenColors.onSurface;
        background = ForestZenColors.background;
        onBackground = ForestZenColors.onBackground;
        break;
      case AppTheme.monochrome:
        primary = MonochromeColors.primary;
        onPrimary = MonochromeColors.onPrimary;
        primaryContainer = MonochromeColors.primaryContainer;
        onPrimaryContainer = MonochromeColors.onPrimaryContainer;
        secondary = MonochromeColors.secondary;
        onSecondary = MonochromeColors.onSecondary;
        tertiary = MonochromeColors.tertiary;
        onTertiary = MonochromeColors.onTertiary;
        surface = MonochromeColors.surface;
        onSurface = MonochromeColors.onSurface;
        background = MonochromeColors.background;
        onBackground = MonochromeColors.onBackground;
        break;
    }
  }

  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: isDark ? Brightness.dark : Brightness.light,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      tertiary: tertiary,
      onTertiary: onTertiary,
      error: isDark ? const Color(0xFFFFB4AB) : const Color(0xFFBA1A1A),
      onError: isDark ? const Color(0xFF690005) : const Color(0xFFFFFFFF),
      errorContainer: isDark ? const Color(0xFF93000A) : const Color(0xFFFFDAD6),
      onErrorContainer: isDark ? const Color(0xFFFFDAD6) : const Color(0xFF410002),
      surface: surface,
      onSurface: onSurface,
      inversePrimary: primary,
      shadow: const Color(0xFF000000),
    ),
    scaffoldBackgroundColor: background,
    appBarTheme: AppBarTheme(
      backgroundColor: surface,
      foregroundColor: onSurface,
      elevation: 0,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.inter(
        fontSize: FontSizes.displayLarge,
        fontWeight: FontWeight.w300,
        color: onSurface,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: FontSizes.displayMedium,
        fontWeight: FontWeight.w300,
        color: onSurface,
      ),
      displaySmall: GoogleFonts.inter(
        fontSize: FontSizes.displaySmall,
        fontWeight: FontWeight.w400,
        color: onSurface,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: FontSizes.headlineLarge,
        fontWeight: FontWeight.w400,
        color: onSurface,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: FontSizes.headlineMedium,
        fontWeight: FontWeight.w500,
        color: onSurface,
      ),
      headlineSmall: GoogleFonts.inter(
        fontSize: FontSizes.headlineSmall,
        fontWeight: FontWeight.w600,
        color: onSurface,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: FontSizes.titleLarge,
        fontWeight: FontWeight.w500,
        color: onSurface,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: FontSizes.titleMedium,
        fontWeight: FontWeight.w500,
        color: onSurface,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: FontSizes.titleSmall,
        fontWeight: FontWeight.w500,
        color: onSurface,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: FontSizes.labelLarge,
        fontWeight: FontWeight.w500,
        color: onSurface,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: FontSizes.labelMedium,
        fontWeight: FontWeight.w500,
        color: onSurface,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: FontSizes.labelSmall,
        fontWeight: FontWeight.w500,
        color: onSurface,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: FontSizes.bodyLarge,
        fontWeight: FontWeight.w400,
        color: onSurface,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: FontSizes.bodyMedium,
        fontWeight: FontWeight.w400,
        color: onSurface,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: FontSizes.bodySmall,
        fontWeight: FontWeight.w400,
        color: onSurface,
      ),
    ),
  );
}

ThemeData get lightTheme => getThemeData(AppTheme.neutralMinimalist, false);
ThemeData get darkTheme => getThemeData(AppTheme.neutralMinimalist, true);