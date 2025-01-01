import "package:flutter/material.dart";

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Color(0xFFF5F5F5), // Light grey
    primary: Color(0xFF6200EE), // Purple
    onPrimary: Color(0xFFFFFFFF), // White
    secondary: Color(0xFF03DAC6), // Teal
    onSecondary: Color(0xFF000000), // Black
    tertiary: Color(0xFF018786), // Dark Teal
    onTertiary: Color(0xFFFFFFFF), // White
    error: Color(0xFFB00020), // Red
    onError: Color(0xFFFFFFFF), // White
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: Color(0xFF121212), // Dark grey
    primary: Color(0xFFBB86FC), // Light Purple
    onPrimary: Color(0xFF000000), // Black
    secondary: Color(0xFF03DAC6), // Teal
    onSecondary: Color(0xFF000000), // Black
    tertiary: Color(0xFF03DAC6), // Teal
    onTertiary: Color(0xFF000000), // Black
    error: Color(0xFFCF6679), // Light Red
    onError: Color(0xFF000000), // Black
  ),
);
