import 'package:flutter/material.dart';
import 'package:project_sathi/constants/app_colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: Colors.white,
    primaryContainer: Color(0xFFD6E2FF),
    onPrimaryContainer: Color(0xFF001A72),

    secondary: AppColors.secondary,
    onSecondary: Colors.white,
    secondaryContainer: Color(0xFFEADDFF),
    onSecondaryContainer: Color(0xFF32107A),

    background: AppColors.backgroundLight,
    onBackground: AppColors.textPrimary,

    surface: AppColors.surfaceLight,
    onSurface: AppColors.textPrimary,

    error: AppColors.error,
    onError: Colors.white,
  ),

  scaffoldBackgroundColor: AppColors.backgroundLight,

  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.surfaceLight,
    foregroundColor: AppColors.textPrimary,
    elevation: 0,
    centerTitle: true,
    titleTextStyle:  TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    scrolledUnderElevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    surfaceTintColor: Colors.transparent,

  ),

  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.textPrimary),
    bodyMedium: TextStyle(color: AppColors.textSecondary),
  ),
);

