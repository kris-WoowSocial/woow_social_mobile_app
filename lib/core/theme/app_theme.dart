import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF000000);
  static const Color secondaryColor = Color(0xFFFFFFFF);
  static const Color accentColor = Color(0xFFFE2C55);
  static const Color textPrimary = Color(0xFF161823);
  static const Color textSecondary = Color(0xFF8A8B94);
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF8F8F8);

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: accentColor,
        background: background,
        surface: surface,
        onPrimary: secondaryColor,
        onSecondary: secondaryColor,
        onBackground: textPrimary,
        onSurface: textPrimary,
      ),
      scaffoldBackgroundColor: background,
      textTheme: GoogleFonts.robotoTextTheme(
        const TextTheme(
          displayLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: textPrimary),
          displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: textPrimary),
          bodyLarge: TextStyle(fontSize: 16, color: textPrimary),
          bodyMedium: TextStyle(fontSize: 14, color: textPrimary),
          bodySmall: TextStyle(fontSize: 12, color: textSecondary),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: textPrimary),
        titleTextStyle: TextStyle(
          color: textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      iconTheme: const IconThemeData(color: textPrimary, size: 24),
    );
  }
}
