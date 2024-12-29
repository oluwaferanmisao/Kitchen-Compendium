import 'package:flutter/material.dart';
import 'package:kitchen_compendium/manager/page_manager.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.white54,
);

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.brown,
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
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
      ),
      home: const PageManager(),
    );
  }
}
