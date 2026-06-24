import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';

class AzkarApp extends StatelessWidget {
  const AzkarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Azkar',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}

