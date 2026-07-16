import 'package:flutter/material.dart';

class AppTheme {
  static const Color background = Color(0xFF071410);
  static const Color surface = Color(0xFF10261F);
  static const Color surfaceElevated = Color(0xFF16362D);
  static const Color gold = Color(0xFFD8B15B);
  static const Color goldSoft = Color(0xFFF0D28A);
  static const Color mint = Color(0xFF8AD8B5);

  static ThemeData get darkTheme {
    final base = ThemeData.dark(useMaterial3: true);

    return base.copyWith(
      colorScheme: const ColorScheme.dark(
        primary: gold,
        secondary: goldSoft,
        tertiary: mint,
        surface: surface,
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onTertiary: Colors.black,
        onSurface: Colors.white,
        background: background,
        error: Color(0xFFFF7D7D),
      ),
      scaffoldBackgroundColor: background,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      cardTheme: CardThemeData(
        color: surfaceElevated,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
          side: BorderSide(color: gold.withOpacity(0.16)),
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
      chipTheme: ChipThemeData(
        backgroundColor: const Color(0xFF16362D),
        selectedColor: gold.withOpacity(0.2),
        labelStyle: const TextStyle(color: Colors.white),
        side: BorderSide(color: Colors.white.withOpacity(0.08)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      ),
    );
  }
}
