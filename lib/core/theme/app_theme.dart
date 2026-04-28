import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'app_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true, // ✅ Recommended for latest Flutter
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: AppFonts.primaryFont,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      // ignore: deprecated_member_use
      background: AppColors.background,
      
    ),
    textTheme: const TextTheme(
      displayLarge: AppTextStyles.heading, // large titles
      bodyLarge: AppTextStyles.body, // normal text
      labelLarge: AppTextStyles.button, // button text
    ),
  );
}
