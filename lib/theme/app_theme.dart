import 'package:flutter/material.dart';

class AppTheme {
  static const Color darkGreen = Color.fromARGB(135, 0, 0, 0);
  static const Color deepGreen = Color.fromARGB(255, 0, 0, 0);
  static const Color gold = Color(0xFFC9A227);
  static const Color goldSoft = Color(0xFFE0C46C);
  static const Color surface = Color(0xFF12382D);

  static ThemeData get darkTheme {
    final base = ThemeData.dark(useMaterial3: true);

    return base.copyWith(
      colorScheme: const ColorScheme.dark(
        primary: gold,
        secondary: goldSoft,
        surface: surface,
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onSurface: Colors.white,
      ),
      scaffoldBackgroundColor: darkGreen,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),

      cardTheme: CardThemeData(
        color: const Color(0xFF173C31),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(color: gold.withOpacity(0.18)),
        ),
        margin: EdgeInsets.zero,
      ),

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: gold,
        linearTrackColor: Color(0x334F7C5F),
      ),
      textTheme: base.textTheme.apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
      dividerTheme: DividerThemeData(color: Colors.white.withOpacity(0.08)),
      iconTheme: const IconThemeData(color: Colors.white),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: const Color(0xFF0A241D),
        contentTextStyle: const TextStyle(color: Colors.white),
        actionTextColor: goldSoft,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
