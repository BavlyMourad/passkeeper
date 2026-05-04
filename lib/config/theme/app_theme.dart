import 'package:flutter/material.dart';
import 'package:passkeeper/config/theme/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: _lightColorScheme,
    scaffoldBackgroundColor: AppColors.greyLightest,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.greyLightest,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
    ),
  );

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: _darkColorScheme,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.blueGreyDark,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
    ),
  );

  static const _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    // Primary
    primary: AppColors.blueMedium,
    onPrimary: AppColors.greyDark, // Text on button
    primaryContainer: Colors.yellow,
    onPrimaryContainer: Colors.yellow,
    // Secondary
    secondary: Colors.yellow,
    onSecondary: AppColors.blueMedium, // Secondary icons
    secondaryContainer: Colors.yellow,
    onSecondaryContainer: Colors.yellow,
    // Tertiary
    tertiary: Colors.yellow,
    onTertiary: Colors.yellow,
    tertiaryContainer: Colors.yellow,
    onTertiaryContainer: Colors.yellow,
    // Surface
    surface: Colors.yellow,
    onSurface: AppColors.greyDark, // Text
    surfaceContainerHighest: AppColors.greyLight, // Switch
    // Error
    error: Colors.yellow,
    onError: Colors.yellow,
    errorContainer: Colors.yellow,
    onErrorContainer: Colors.yellow,
    // Outline
    outline: AppColors.greyLightest, // Switch
    outlineVariant: Colors.yellow,
    // Inverse
    inverseSurface: Colors.yellow,
    onInverseSurface: Colors.yellow,
    inversePrimary: Colors.yellow,
    // Shadow / scrim
    shadow: Colors.yellow,
    scrim: Colors.yellow,
  );

  static const _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    // Primary
    primary: AppColors.blueLight,
    onPrimary: AppColors.greyLightest, // Text on button
    primaryContainer: Colors.yellow,
    onPrimaryContainer: Colors.yellow,
    // Secondary
    secondary: Colors.yellow,
    onSecondary: AppColors.greyLight, // Secondary icons
    secondaryContainer: Colors.yellow,
    onSecondaryContainer: Colors.yellow,
    // Tertiary
    tertiary: Colors.yellow,
    onTertiary: Colors.yellow,
    tertiaryContainer: Colors.yellow,
    onTertiaryContainer: Colors.yellow,
    // Surface
    surface: Colors.yellow,
    onSurface: AppColors.greyLightest, // Text
    surfaceContainerHighest: AppColors.greyLight, // Switch
    // Error
    error: Colors.yellow,
    onError: Colors.yellow,
    errorContainer: Colors.yellow,
    onErrorContainer: Colors.yellow,
    // Outline
    outline: AppColors.greyLightest, // Switch
    outlineVariant: Colors.yellow,
    // Inverse
    inverseSurface: Colors.yellow,
    onInverseSurface: Colors.yellow,
    inversePrimary: Colors.yellow,
    // Shadow / scrim
    shadow: Colors.yellow,
    scrim: Colors.yellow,
  );
}
