import 'package:flutter/material.dart';

class AppColors {
  // Light Theme Colors
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    // Main background color - soft white with slight warmth
    surface: Color(0xFFFAF9F7),

    // Primary - Warm terracotta
    primary: Color(0xFFE67E22),
    onPrimary: Color(0xFFFFFFFF),

    // Secondary - Sage green
    secondary: Color(0xFF7CB342),
    onSecondary: Color(0xFFFFFFFF),

    // Tertiary - Warm gold
    tertiary: Color(0xFFFFA000),
    onTertiary: Color(0xFF000000),

    // Error - Soft red
    error: Color(0xFFD32F2F),
    onError: Color(0xFFFFFFFF),

    // Additional required properties
    background: Color(0xFFFAF9F7),
    onBackground: Color(0xFF1C1B1F),
    onSurface: Color(0xFF1C1B1F),
    surfaceVariant: Color(0xFFE7E0EC),
    onSurfaceVariant: Color(0xFF49454F),
    outline: Color(0xFF79747E),
  );

  // Dark Theme Colors
  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    // Main background color - deep gray with slight warmth
    surface: Color(0xFF1C1917),

    // Primary - Lighter terracotta
    primary: Color(0xFFFF9F59),
    onPrimary: Color(0xFF000000),

    // Secondary - Light sage
    secondary: Color(0xFF9CCC65),
    onSecondary: Color(0xFF000000),

    // Tertiary - Warm amber
    tertiary: Color(0xFFFFB74D),
    onTertiary: Color(0xFF000000),

    // Error - Lighter red
    error: Color(0xFFEF5350),
    onError: Color(0xFF000000),

    // Additional required properties
    background: Color(0xFF1C1917),
    onBackground: Color(0xFFE6E1E5),
    onSurface: Color(0xFFE6E1E5),
    surfaceVariant: Color(0xFF49454F),
    onSurfaceVariant: Color(0xFFCAC4D0),
    outline: Color(0xFF938F99),
  );
}