import 'package:flutter/material.dart';
import 'package:kitchen_compendium/manager/page_manager.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.white54,
  contrastLevel: -1.0,
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Colors.brown,
  contrastLevel: -1.0,
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kitchen Compendium',
      theme: ThemeData.light().copyWith(
        colorScheme: kColorScheme,
        textTheme: const TextTheme().copyWith(
          titleMedium: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        textTheme: const TextTheme().copyWith(
          titleMedium: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const PageManager(),
    );
  }
}
