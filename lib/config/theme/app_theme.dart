import 'package:flutter/material.dart';
import 'package:passkeeper/config/theme/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: _lightColorScheme,
    scaffoldBackgroundColor: AppColors.greyLightest,
  );

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: _darkColorScheme,
    scaffoldBackgroundColor: AppColors.black,
  );

  static const _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    // Primary
    primary: AppColors.blueMedium,
    onPrimary: AppColors.greyLightest,
    primaryContainer: AppColors.blueMedium,
    onPrimaryContainer: AppColors.greyLightest,
    // Secondary
    secondary: AppColors.blueLight,
    onSecondary: AppColors.greyLightest,
    secondaryContainer: AppColors.greyLight,
    onSecondaryContainer: AppColors.greyDark,
    // Tertiary
    tertiary: AppColors.blueDark,
    onTertiary: AppColors.white,
    tertiaryContainer: AppColors.blueLight,
    onTertiaryContainer: AppColors.blueDark,
    // Surface
    surface: AppColors.greyLightest,
    onSurface: AppColors.blueMedium,
    surfaceContainerHighest: AppColors.greyLightest,
    // Error
    error: AppColors.redSoft,
    onError: AppColors.greyLightest,
    errorContainer: AppColors.redSoft,
    onErrorContainer: AppColors.greyLightest,
    // Outline
    outline: AppColors.greyLight,
    outlineVariant: AppColors.greyLightest,
    // Inverse
    inverseSurface: AppColors.greyDark,
    onInverseSurface: AppColors.greyLightest,
    inversePrimary: AppColors.blueLight,
    // Shadow / scrim
    shadow: AppColors.black,
    scrim: AppColors.black,
  );

  static const _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    // Primary
    primary: AppColors.blueMedium,
    onPrimary: AppColors.white,
    primaryContainer: AppColors.blueLight,
    onPrimaryContainer: AppColors.blueDark,
    // Secondary
    secondary: AppColors.greyDark,
    onSecondary: AppColors.white,
    secondaryContainer: AppColors.greyLight,
    onSecondaryContainer: AppColors.greyDark,
    // Tertiary
    tertiary: AppColors.blueDark,
    onTertiary: AppColors.white,
    tertiaryContainer: AppColors.blueLight,
    onTertiaryContainer: AppColors.blueDark,
    // Surface
    surface: AppColors.white,
    onSurface: AppColors.greyDark,
    surfaceContainerHighest: AppColors.greyLightest,
    // Error
    error: AppColors.redSoft,
    onError: AppColors.white,
    errorContainer: AppColors.redSoft,
    onErrorContainer: AppColors.white,
    // Outline
    outline: AppColors.greyLight,
    outlineVariant: AppColors.greyLightest,
    // Inverse
    inverseSurface: AppColors.greyDark,
    onInverseSurface: AppColors.greyLightest,
    inversePrimary: AppColors.blueLight,
    // Shadow / scrim
    shadow: AppColors.black,
    scrim: AppColors.black,
  );
}
