import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kitchen_compendium/manager/page_manager.dart';
import 'package:kitchen_compendium/theme/appcolors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kitchen Compendium',
      theme: ThemeData(
        colorScheme: AppColors.lightColorScheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: AppColors.darkColorScheme,
        useMaterial3: true,
      ),
      home: const PageManager(),
    );
  }
}
