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


    surface: AppColors.surfaceLight,
    onSurface: AppColors.textPrimary,

    error: AppColors.error,
    onError: Colors.white,
  ),


  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.surfaceLight,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: const TextStyle(
      color: AppColors.textPrimary,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.textPrimary,
    ),
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
  ),


  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.textPrimary),
    bodyMedium: TextStyle(color: AppColors.textSecondary),
  ),
);

