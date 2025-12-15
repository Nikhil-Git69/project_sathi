import 'package:flutter/material.dart';
import 'package:project_sathi/constants/app_colors.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,

    primary: Color(0xFF82A0FF),
    onPrimary: Color(0xFF001A72),
    primaryContainer: AppColors.primaryVariant,
    onPrimaryContainer: Colors.white,

    secondary: Color(0xFFC5A3FF),
    onSecondary: Colors.white,
    secondaryContainer: Color(0xFF4C2E9B),
    onSecondaryContainer: Colors.white,



    surface: AppColors.surfaceDark,
    onSurface: Color(0xFFE0E0E0),

    error: AppColors.error,
    onError: Colors.white,
  ),

  scaffoldBackgroundColor: AppColors.backgroundDark,

  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.surfaceDark,
    foregroundColor: Colors.white,
    elevation: 0,
    titleTextStyle:  TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    centerTitle: true,
    scrolledUnderElevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    surfaceTintColor: Colors.transparent,
  ),


  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Color(0xFFAAAAAA)),
  ),
);
